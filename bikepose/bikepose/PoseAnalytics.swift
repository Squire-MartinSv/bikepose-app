import SwiftUI
import CoreML
import Vision
import UIKit

struct PoseAnalytics: View {
    let image: UIImage
    var selectedPosition: String
    @State private var annotatedImage: UIImage?
    @State private var anglePoint14: Double = 0.0
    @State private var anglePoint8: Double = 0.0
    @State private var anglePoint7: Double = 0.0
    @State private var anglePoint13: Double = 0.0
    @State private var anglePoint6: Double = 0.0
    @State private var anglePoint6head: Double = 0.0
    @State private var anglePoint5: Double = 0.0
    @State private var anglePoint5head: Double = 0.0
    @State private var anglePoint12: Double = 0.0
    @State private var anglePoint11: Double = 0.0
    @State private var showingSaveAlert = false // To show confirmation after saving
    @State private var showingPDFSaveAlert = false // Alert for PDF save confirmation
    @State private var documentController: UIDocumentInteractionController?
    
    let displayWidth: CGFloat = UIScreen.main.bounds.width * 0.9
    
    var body: some View {
        ScrollView{
            VStack {
                if let annotatedImage = annotatedImage {
                    Image(uiImage: annotatedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: displayWidth)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 3)
                        )
                } else {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: displayWidth)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 3)
                        )
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    // Display the calculated angles below the image
                    if selectedPosition == "Right" {
                        ExpandableAngleBox(angle: anglePoint14, label: "Angle at Right Knee (Point 14)", jointName: "Right Knee", color: .purple)
                        ExpandableAngleBox(angle: anglePoint8, label: "Angle at Right Elbow (Point 8)", jointName: "Right Elbow", color: .purple)
                        ExpandableAngleBox(angle: anglePoint6, label: "Right Shoulder-to-Elbow (Point 6)", jointName: "Right Shoulder-Elbow", color: .purple)
                        ExpandableAngleBox(angle: anglePoint6head, label: "Right Shoulder-to-Neck (Point 6)", jointName: "Right Shoulder-Neck", color: .purple)
                        ExpandableAngleBox(angle: anglePoint12, label: "Right hip (Point 12)", jointName: "Right Hip", color: .purple)
                    } else if selectedPosition == "Left" {
                        ExpandableAngleBox(angle: anglePoint13, label: "Angle at Left Knee (Point 13)", jointName: "Left Knee", color: .purple)
                        ExpandableAngleBox(angle: anglePoint7, label: "Angle at Left Elbow (Point 7)", jointName: "Left Elbow", color: .purple)
                        ExpandableAngleBox(angle: anglePoint5, label: "Left Shoulder-to-Elbow (Point 5)", jointName: "Left Shoulder-Elbow", color: .purple)
                        ExpandableAngleBox(angle: anglePoint5head, label: "Left Shoulder-to-Neck (Point 5)", jointName: "Left Shoulder-Neck", color: .purple)
                        ExpandableAngleBox(angle: anglePoint11, label: "Left hip (Point 11)", jointName: "Left Hip", color: .purple)
                    }
                    // Disclaimer text
                    Text("Note: All measured positions may contain divergencies and are for guidance only. Recommendations can vary based on individual rider preferences and other influencing factors.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .center)
                
                // HStack for download button and additional placeholder button
                HStack(spacing: 20) {
                    Button(action: saveAnnotatedImage) {
                        Text("Download Image")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple.opacity(0.95))
                            .cornerRadius(8)
                
                    }
                    
                    Button(action: saveAnalyticsAsPDF) {
                        Text("Save analytics")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(8)
                        
                    }
                }
                .padding(.top, 20)
                .alert(isPresented: $showingSaveAlert) {
                    Alert(title: Text("Image Saved"), message: Text("Your annotated image has been saved to Photos."), dismissButton: .default(Text("OK")))
                }
                .alert(isPresented: $showingPDFSaveAlert) {
                    Alert(title: Text("PDF Saved"), message: Text("Your analytics PDF has been saved to Files."), dismissButton: .default(Text("OK")))
                }
            }
        }
        .onAppear {
            processImageAndAnnotate(image: image)
        }
    }

    private func saveAnalyticsAsPDF() {
        guard let annotatedImage = annotatedImage else {
            print("Annotated image is not available.")
            return
        }

        // Define the PDF page bounds with A4 size
        let pdfBounds = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4 dimensions in points
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pdfBounds)

        // Create the PDF data
        let pdfData = pdfRenderer.pdfData { context in
            context.beginPage()

            // Calculate the aspect ratio of the image and the maximum allowable size
            let maxImageWidth = pdfBounds.width - 80 // 40pt margin on each side
            let maxImageHeight = pdfBounds.height / 2 // Reserve half the page height for the image

            // Determine the final dimensions of the image to maintain aspect ratio
            var finalImageWidth = annotatedImage.size.width
            var finalImageHeight = annotatedImage.size.height

            if finalImageWidth > maxImageWidth || finalImageHeight > maxImageHeight {
                // Scale down proportionally
                let widthScale = maxImageWidth / finalImageWidth
                let heightScale = maxImageHeight / finalImageHeight
                let scale = min(widthScale, heightScale)
                finalImageWidth *= scale
                finalImageHeight *= scale
            }

            // Center the image horizontally, position it at the top with a margin
            let imageRect = CGRect(
                x: (pdfBounds.width - finalImageWidth) / 2,
                y: 40,
                width: finalImageWidth,
                height: finalImageHeight
            )
            annotatedImage.draw(in: imageRect)
            
            // Starting y-position for text, just below the annotated image
            var yPosition: CGFloat = imageRect.maxY + 20
            let leftMargin: CGFloat = 40
            let textWidth = pdfBounds.width - 2 * leftMargin

            // Define labels with point designations
            let labelMappings: [String: (Double, String)] = [
                "Right Knee": (anglePoint14, "Right Knee (Point 14)"),
                "Right Elbow": (anglePoint8, "Right Elbow (Point 8)"),
                "Right Shoulder-Elbow": (anglePoint6, "Right Shoulder-to-Elbow (Point 6)"),
                "Right Shoulder-Neck": (anglePoint6head, "Right Shoulder-to-Neck (Point 6)"),
                "Right Hip": (anglePoint12, "Right Hip (Point 12)"),
                "Left Knee": (anglePoint13, "Left Knee (Point 13)"),
                "Left Elbow": (anglePoint7, "Left Elbow (Point 7)"),
                "Left Shoulder-Elbow": (anglePoint5, "Left Shoulder-to-Elbow (Point 5)"),
                "Left Shoulder-Neck": (anglePoint5head, "Left Shoulder-to-Neck (Point 5)"),
                "Left Hip": (anglePoint11, "Left Hip (Point 11)")
            ]
            
            // Filter angleRanges based on the selected side (e.g., "Right" or "Left")
            let relevantAngles = angleRanges.filter { $0.jointName.contains(selectedPosition) }
            
            for angleRange in relevantAngles {
                // Retrieve the actual angle value and formatted label text for the current joint
                guard let (angleValue, formattedLabel) = labelMappings[angleRange.jointName] else {
                    continue
                }

                // Check if there's enough space for the next entry, otherwise start a new page
                if yPosition + 100 > pdfBounds.height { // Estimate for content height
                    context.beginPage()
                    yPosition = 40 // Reset yPosition at the top of the new page
                }

                // Label and Angle
                let labelText = "\(formattedLabel): \(Int(angleValue))°"
                let labelAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16, weight: .bold),
                    .foregroundColor: UIColor.purple
                ]
                let labelAttributedString = NSAttributedString(string: labelText, attributes: labelAttributes)
                labelAttributedString.draw(in: CGRect(x: leftMargin, y: yPosition, width: textWidth, height: 20))
                yPosition += 24
                
                // Description with automatic wrapping
                let descriptionText = "Description: \(angleRange.description)"
                let descriptionAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: UIColor.darkGray
                ]
                let descriptionBoundingRect = CGRect(x: leftMargin, y: yPosition, width: textWidth, height: 80)
                let descriptionAttributedString = NSAttributedString(string: descriptionText, attributes: descriptionAttributes)
                descriptionAttributedString.draw(with: descriptionBoundingRect, options: .usesLineFragmentOrigin, context: nil)
                yPosition += descriptionBoundingRect.height + 4

                // Angle Range
                let rangeText = "Recommended range: \(Int(angleRange.minAngle))° - \(Int(angleRange.maxAngle))°"
                let rangeAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: UIColor.gray
                ]
                let rangeAttributedString = NSAttributedString(string: rangeText, attributes: rangeAttributes)
                rangeAttributedString.draw(in: CGRect(x: leftMargin, y: yPosition, width: textWidth, height: 20))
                yPosition += 28 // Extra spacing after each entry
            }
        }

        // Save to the Documents directory within the app's sandbox, accessible in Files app under "On My iPhone/iPad > [Your App Name]"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pdfURL = documentsDirectory.appendingPathComponent("Analytics.pdf")

        do {
            try pdfData.write(to: pdfURL)
            showingPDFSaveAlert = true // Show confirmation alert after saving
            print("PDF saved successfully to \(pdfURL.path)")
            
            // Optional: Inform the user about where to find the PDF in the Files app
            DispatchQueue.main.async {
                showingPDFSaveAlert = true
            }
            
        } catch {
            print("Error saving PDF: \(error)")
        }
    }

    
    // Function to save the annotated image to Photos
    private func saveAnnotatedImage() {
        guard let imageToSave = annotatedImage else {
            print("No annotated image to save.")
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        showingSaveAlert = true // Show confirmation alert after saving
    }

    private func processImageAndAnnotate(image: UIImage) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let (boundingBox, keypoints) = self.extractCoordinates(from: image),
               let annotated = self.drawBoundingBoxAndKeypoints(on: image, boundingBox: boundingBox, keypoints: keypoints) {
                
                // Calculate angles at points 14, 8, 7, 13, and 6
                let angleAtPoint14 = self.calculateAngle(at: 14, keypoints: keypoints, connection1: 12, connection2: 16)
                let angleAtPoint8 = self.calculateAngle(at: 8, keypoints: keypoints, connection1: 6, connection2: 10)
                let angleAtPoint7 = self.calculateAngle(at: 7, keypoints: keypoints, connection1: 5, connection2: 9)
                let angleAtPoint13 = self.calculateAngle(at: 13, keypoints: keypoints, connection1: 11, connection2: 15)
                let angleAtPoint6 = self.calculateAngle(at: 6, keypoints: keypoints, connection1: 12, connection2: 8)
                let angleAtPoint6head = self.calculateAngle(at: 6, keypoints: keypoints, connection1: 12, connection2: 4)
                let angleAtPoint5 = self.calculateAngle(at: 5, keypoints: keypoints, connection1: 11, connection2: 7)
                let angleAtPoint5head = self.calculateAngle(at: 5, keypoints: keypoints, connection1: 11, connection2: 4)
                let angleAtPoint12 = self.calculateAngle(at: 12, keypoints: keypoints, connection1: 14, connection2: 6)
                let angleAtPoint11 = self.calculateAngle(at: 11, keypoints: keypoints, connection1: 13, connection2: 5)

                
                // Update the UI on the main thread
                DispatchQueue.main.async {
                    self.annotatedImage = annotated
                    self.anglePoint14 = angleAtPoint14
                    self.anglePoint8 = angleAtPoint8
                    self.anglePoint7 = angleAtPoint7
                    self.anglePoint13 = angleAtPoint13
                    self.anglePoint6 = angleAtPoint6
                    self.anglePoint6head = angleAtPoint6head
                    self.anglePoint5 = angleAtPoint5
                    self.anglePoint5head = angleAtPoint5head
                    self.anglePoint12 = angleAtPoint12
                    self.anglePoint11 = angleAtPoint11
                }
            }
        }
    }

    private func extractCoordinates(from image: UIImage) -> (CGRect, [(CGPoint, Float)])? {
        guard let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 640, height: 640)),
              let pixelBuffer = resizedImage.toCVPixelBuffer() else {
            print("Failed to resize image or convert to pixel buffer.")
            return nil
        }
        
        do {
            let model = try yolov8xpose(configuration: MLModelConfiguration())
            let input = yolov8xposeInput(image: pixelBuffer)
            let prediction = try model.prediction(input: input)
            let shapedArray = prediction.var_1487ShapedArray
            
            let widthScale = image.size.width / 640
            let heightScale = image.size.height / 640
            
            for anchorIndex in 0..<8400 {
                if let confidence = shapedArray[0, 4, anchorIndex].scalar, confidence > 0.5 {
                    if let centerX = shapedArray[0, 0, anchorIndex].scalar,
                       let centerY = shapedArray[0, 1, anchorIndex].scalar,
                       let boxWidth = shapedArray[0, 2, anchorIndex].scalar,
                       let boxHeight = shapedArray[0, 3, anchorIndex].scalar {
                        
                        let scaledCenterX = CGFloat(centerX) * widthScale
                        let scaledCenterY = CGFloat(centerY) * heightScale
                        let scaledBoxWidth = CGFloat(boxWidth) * widthScale
                        let scaledBoxHeight = CGFloat(boxHeight) * heightScale
                        
                        let boundingBox = CGRect(
                            x: scaledCenterX - scaledBoxWidth / 2,
                            y: scaledCenterY - scaledBoxHeight / 2,
                            width: scaledBoxWidth,
                            height: scaledBoxHeight
                        )
                        
                        var keypoints = [(CGPoint, Float)]()
                        for keypointIndex in stride(from: 5, to: 55, by: 3) {
                            if let keypointX = shapedArray[0, keypointIndex, anchorIndex].scalar,
                               let keypointY = shapedArray[0, keypointIndex + 1, anchorIndex].scalar,
                               let keypointConfidence = shapedArray[0, keypointIndex + 2, anchorIndex].scalar {
                                
                                let scaledKeypointX = CGFloat(keypointX) * widthScale
                                let scaledKeypointY = CGFloat(keypointY) * heightScale
                                let keypoint = CGPoint(x: scaledKeypointX, y: scaledKeypointY)
                                
                                keypoints.append((keypoint, keypointConfidence))
                            }
                        }
                        
                        return (boundingBox, keypoints)
                    }
                }
            }
        } catch {
            print("Error during model prediction: \(error)")
        }
        return nil
    }

    private func drawBoundingBoxAndKeypoints(on image: UIImage, boundingBox: CGRect, keypoints: [(CGPoint, Float)]) -> UIImage? {
        let connections = [
            (0, 1), (0, 2), (1, 3), (2, 4),       // Head
            (5, 6), (5, 11), (6, 12), (11, 12),   // Torso
            (5, 7), (6, 8), (7, 9), (8, 10),      // Arms
            (11, 13), (12, 14), (13, 15), (14, 16),
            (4, 6) // Head to shoulder connection
        ]
        
        let scale = displayWidth / image.size.width
        let scaledBoundingBox = CGRect(
            x: boundingBox.origin.x * scale,
            y: boundingBox.origin.y * scale,
            width: boundingBox.width * scale,
            height: boundingBox.height * scale
        )
        let scaledKeypoints = keypoints.map { (point, confidence) in
            (CGPoint(x: point.x * scale, y: point.y * scale), confidence)
        }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: image.size.width * scale, height: image.size.height * scale))
        
        let annotatedImage = renderer.image { context in
            image.draw(in: CGRect(origin: .zero, size: CGSize(width: image.size.width * scale, height: image.size.height * scale)))
            UIColor.magenta.setStroke()
            let boundingBoxPath = UIBezierPath(rect: scaledBoundingBox)
            boundingBoxPath.lineWidth = 2
            boundingBoxPath.stroke()
            
            UIColor.yellow.setStroke()
            for (startIdx, endIdx) in connections {
                let startPoint = scaledKeypoints[startIdx].0
                let endPoint = scaledKeypoints[endIdx].0
                let startConfidence = scaledKeypoints[startIdx].1
                let endConfidence = scaledKeypoints[endIdx].1
                
                if startConfidence > 0.5 && endConfidence > 0.5 {
                    let linePath = UIBezierPath()
                    linePath.move(to: startPoint)
                    linePath.addLine(to: endPoint)
                    linePath.lineWidth = 2
                    linePath.stroke()
                }
            }
            
            UIColor.yellow.setFill()
            let textAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.magenta,
                .font: UIFont.systemFont(ofSize: 14)
            ]
            
            for (index, (point, confidence)) in scaledKeypoints.enumerated() where confidence > 0.5 {
                let keypointRect = CGRect(x: point.x - 2, y: point.y - 2, width: 6, height: 6)
                let keypointPath = UIBezierPath(ovalIn: keypointRect)
                keypointPath.fill()
                
                let label = "\(index)"
                label.draw(at: CGPoint(x: point.x + 4, y: point.y - 4), withAttributes: textAttributes)
            }
        }
        
        return annotatedImage
    }


    private func calculateAngle(at jointIndex: Int, keypoints: [(CGPoint, Float)], connection1: Int, connection2: Int) -> Double {
        let joint = keypoints[jointIndex].0
        let point1 = keypoints[connection1].0
        let point2 = keypoints[connection2].0
        
        let vector1 = CGPoint(x: point1.x - joint.x, y: point1.y - joint.y)
        let vector2 = CGPoint(x: point2.x - joint.x, y: point2.y - joint.y)
        
        let dotProduct = vector1.x * vector2.x + vector1.y * vector2.y
        let magnitude1 = sqrt(vector1.x * vector1.x + vector1.y * vector1.y)
        let magnitude2 = sqrt(vector2.x * vector2.x + vector2.y * vector2.y)
        
        let cosineAngle = dotProduct / (magnitude1 * magnitude2)
        let angleInRadians = acos(cosineAngle)
        
        return angleInRadians * (180 / Double.pi) // Convert radians to degrees
    }

    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        image.draw(in: CGRect(origin: .zero, size: targetSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

struct ExpandableAngleBox: View {
    let angle: Double
    let label: String
    let jointName: String
    let color: Color
    @State private var isExpanded: Bool = false
    
    var body: some View {
        // Retrieve the angle range for the given joint name
        let angleRange = getAngleRange(for: jointName) ?? AngleRange(jointName: jointName, minAngle: 0, maxAngle: 180, description: "No description available.")
        
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                VStack(alignment: .leading, spacing: 8) {
                    // Display the description text from the angle range data
                    Text(angleRange.description)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .padding(.bottom, 4)
                    
                    // Angle range indicator with retrieved range values
                    AngleRangeIndicator(currentAngle: angle, minAngle: angleRange.minAngle, maxAngle: angleRange.maxAngle)
                        .frame(height: 16)
                        .cornerRadius(5)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                )
            },
            label: {
                HStack {
                    Text(label) // Using "label" for the Expandable box title
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(Int(angle))°")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    
                    // Custom chevron icon with subtle shadow
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(isExpanded ? 90 : 0)) // Rotate chevron when expanded
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                }
                .padding(12)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.purple.opacity(0.75), Color.purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                )
            }
        )
        .padding(.vertical, 2) // Reduced padding to bring boxes closer
        .accentColor(.clear) // Remove default system chevron
    }
}

struct AngleRangeIndicator: View {
    let currentAngle: Double
    let minAngle: Double
    let maxAngle: Double
    
    var body: some View {
        VStack {
            HStack {
                // Display min angle
                Text("\(Int(minAngle))°")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        // Background gradient for range
                        LinearGradient(
                            gradient: Gradient(colors: [.orange, .yellow, .green, .yellow, .orange]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(height: 8) // Slightly smaller bar height
                        .cornerRadius(4)
                        
                        // Slider-like rectangle indicating the current angle
                        let position = calculatePosition(for: currentAngle, width: geometry.size.width)
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 8, height: 16) // Slider shape, taller than the colored bar
                            .foregroundColor(.gray)
                            .offset(x: position - 4)
                    }
                }
                
                // Display max angle
                Text("\(Int(maxAngle))°")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 20)
    }
    
    // Helper method to calculate the x-position for the indicator
    private func calculatePosition(for angle: Double, width: CGFloat) -> CGFloat {
        let clampedAngle = min(max(angle, minAngle), maxAngle)
        let range = maxAngle - minAngle
        let normalizedPosition = (clampedAngle - minAngle) / range
        return CGFloat(normalizedPosition) * width
    }
}

extension UIImage {
    func toCVPixelBuffer() -> CVPixelBuffer? {
        let attrs = [
            kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
            kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
        ] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(size.width), Int(size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else { return nil }
        
        CVPixelBufferLockBaseAddress(buffer, [])
        let context = CGContext(
            data: CVPixelBufferGetBaseAddress(buffer),
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        )
        
        guard let cgImage = self.cgImage else { return nil }
        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        CVPixelBufferUnlockBaseAddress(buffer, [])
        
        return buffer
    }
}

