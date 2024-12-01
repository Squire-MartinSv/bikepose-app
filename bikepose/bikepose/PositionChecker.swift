//
//  PositionChecker.swift
//  bikepose
//
//  Created by Martin Svadlenka on 16.10.2024.
//
import SwiftUI
import Vision

struct PositionChecker: View {
    var image: UIImage
    var bikeType: String
    var validationHandler: (Bool) -> Void

    @State private var isLoading = true
    @State private var detectedObjects: [String] = []
    @State private var message: String = ""
    @State private var isValid: Bool = false  // Add this state variable

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                    .onAppear {
                        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 3) {
                            let handler = YOLOModelHandler()
                            handler.detectObjects(in: image) { results in
                                DispatchQueue.main.async {
                                    self.detectedObjects = results
                                    self.validateDetection()
                                    withAnimation {
                                        self.isLoading = false
                                    }
                                }
                            }
                        }
                    }
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 300)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.purple, lineWidth: 5)
                            )

                        ValidationResultView(isValid: isValid, message: message)

                        DetectedObjectsListView(detectedObjects: detectedObjects)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Picture Validation")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func validateDetection() {
        let expected = expectedObjects(for: bikeType)
        isValid = expected.allSatisfy { expectedItem in
            detectedObjects.contains(where: { $0.contains(expectedItem) })
        }

        message = isValid
            ? "Valid objects detected. You can now navigate back to check the body position."
            : "No valid objects detected based on bike type. Please select a better picture focusing on resolution and clarity."

        validationHandler(isValid)
    }
}

struct ValidationResultView: View {
    var isValid: Bool
    var message: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isValid ? "checkmark.circle.fill" : "xmark.octagon.fill")
                .foregroundColor(isValid ? .green : .red)
                .font(.system(size: 60))
                .padding()

            Text(isValid ? "Validation Successful" : "Validation Failed")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(isValid ? .green : .red)

            Text(message)
                .multilineTextAlignment(.center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isValid ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                )
        }
        .padding()
    }
}

struct DetectedObjectsListView: View {
    var detectedObjects: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Detected Objects:")
                .font(.headline)

            ForEach(detectedObjects, id: \.self) { object in
                DetectedObjectRow(object: object)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.secondary.opacity(0.1))
        )
    }
}

struct DetectedObjectRow: View {
    var object: String

    var body: some View {
        HStack {
            Image(systemName: "dot.circle")
                .foregroundColor(.blue)
            Text(object)
                .font(.body)
        }
    }
}



func expectedObjects(for bikeType: String) -> [String] {
    switch bikeType {
//    case "Road bike", "Time-trial bike", "Kids bike":
//        return ["bicycle", "person"]
    default:
        return ["bicycle", "person"]
    }
}

class YOLOModelHandler {
    private var model: VNCoreMLModel?
    private var request: VNCoreMLRequest?

    init() {
        do {
            let configuration = MLModelConfiguration()
            let model = try yolov8m(configuration: configuration)  // Use the correct model
            self.model = try VNCoreMLModel(for: model.model)
            self.request = VNCoreMLRequest(model: self.model!, completionHandler: { (request, error) in
                // Error handling here
            })
        } catch {
            print("Error loading model: \(error)")
        }
    }

    func detectObjects(in image: UIImage, completion: @escaping ([String]) -> Void) {
        guard let ciImage = CIImage(image: image),
              let request = self.request else {
            completion([])
            return
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
                // Assuming the completion block is handled inside handleDetection
                self.handleDetection(request: request, error: nil, completion: completion)
            } catch {
                print("Failed to perform detection: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
    }

    private func handleDetection(request: VNRequest, error: Error?, completion: @escaping ([String]) -> Void) {
        guard let results = request.results as? [VNRecognizedObjectObservation] else {
            DispatchQueue.main.async {
                completion([])
            }
            return
        }

        let descriptions = results.map { result -> String in
            let confidence = String(format: "%.2f", result.confidence * 100)
            return "\(result.labels.first?.identifier ?? "Unknown"): \(confidence)%"
        }

        DispatchQueue.main.async {
            completion(descriptions)
        }
    }
}

struct PositionChecker_Previews: PreviewProvider {
    static var previews: some View {
        // Using a system icon as a placeholder image
        if let placeholderImage = UIImage(systemName: "photo") {
            PositionChecker(image: placeholderImage, bikeType: "Road bike", validationHandler: { isValid in
                print("Validation Status: \(isValid)")
            })
        } else {
            Text("Failed to load placeholder image")
        }
    }
}

