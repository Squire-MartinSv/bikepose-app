//
//  CameraView.swift
//  bikepose
//
//  Created by Martin Svadlenka on 14.10.2024.
//

import SwiftUI

struct CameraView: View {
    var bikeType: String
    @State private var isImagePickerDisplayed = false
    @State private var selectedImage: UIImage?
    @State private var navigateToComingSoon = false
    @State private var navigateToHowToPicture = false
    @State private var navigateToPositionChecker = false
    @State private var navigateToPoseAnalyzer = false
    @State private var isPictureValidated = false
    @State private var showAlert = false
    @State private var selectedPosition: String = "Left"
    @State private var isRightSelected: Bool = false
    @State private var showInfoAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView { // Embed in a ScrollView for scrollable content
                VStack {
                    Text("Selected bike type: \(bikeType)")
                        .font(.system(size: 18))
                        .padding()
                    
                    Spacer()
                    
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 300)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isPictureValidated ? Color.green : Color.gray, lineWidth: 5)
                            )
                        
                        // Toggle Switcher for "Left" and "Right"
                        HStack {
                            Text("Left")
                                .foregroundColor(isRightSelected ? .gray : .primary)
                            
                            Toggle(isOn: $isRightSelected) {
                                Text("")
                            }
                            .labelsHidden()
                            .tint(.purple)
                            .onChange(of: isRightSelected) {
                                selectedPosition = isRightSelected ? "Right" : "Left"
                            }
                            
                            Text("Right")
                                .foregroundColor(isRightSelected ? .primary : .gray)
                        }
                        .padding()
                        
                        Button(action: {
                            navigateToPositionChecker = true
                        }) {
                            Label("Validate picture", systemImage: "checkmark.circle")
                        }
                        .buttonStyle(PurpleButtonStyle())
                        
                        Button(action: {
                            if isPictureValidated {
                                navigateToPoseAnalyzer = true
                            } else {
                                showAlert = true
                            }
                        }) {
                            Label("Analyse body position", systemImage: "person.crop.rectangle")
                        }
                        .buttonStyle(PurpleButtonStyle())
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Validation Required"), message: Text("Image must be validated first, before it can be analysed."), dismissButton: .default(Text("OK")))
                        }
                        
                        Button("Change Image") {
                            isImagePickerDisplayed = true
                        }
                        .buttonStyle(YellowButtonStyle())
                    } else {
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                navigateToHowToPicture = true
                            }) {
                                VStack {
                                    Image(systemName: "info.circle")
                                        .font(.system(size: 50))
                                        .foregroundColor(.purple)
                                    
                                    Text("Read: How to take a proper picture for pose analysis?")
                                        .font(.headline)
                                        .foregroundColor(.purple)
                                        .padding(.top, 5)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                        
                        Text("No image selected")
                            .foregroundColor(.secondary)

                        Button("Upload Image") {
                            isImagePickerDisplayed = true
                        }
                        .buttonStyle(PurpleButtonStyle())
                        
                        Button("Take a picture") {
                            navigateToComingSoon = true
                        }
                        .buttonStyle(GreyButtonStyle())
                    }
                }
                .padding()
            }
            .navigationBarTitle("Take a position picture or pick your own", displayMode: .inline)
            .sheet(isPresented: $isImagePickerDisplayed) {
                ImagePicker(selectedImage: $selectedImage)
                    .onChange(of: selectedImage) {
                        isPictureValidated = false
                    }
            }
            .navigationDestination(isPresented: $navigateToComingSoon) {
                ComingSoon()
            }
            .navigationDestination(isPresented: $navigateToHowToPicture) {
                HowToPicture()
            }
            .navigationDestination(isPresented: $navigateToPositionChecker) {
                if let image = selectedImage {
                    PositionChecker(image: image, bikeType: bikeType, validationHandler: { isValid in
                        isPictureValidated = isValid
                    })
                }
            }
            .navigationDestination(isPresented: $navigateToPoseAnalyzer) {
                if let image = selectedImage {
                    PoseAnalytics(image: image, selectedPosition: selectedPosition, bikeType: bikeType)
                }
            }
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Intentionally left empty
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct StandardButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 50)  // Set a fixed height for all buttons
            .frame(maxWidth: .infinity)  // Ensure buttons expand to fill width
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(bikeType: "Road Bike")
    }
}
