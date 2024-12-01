//
//  BikeSelectionView.swift
//  bikepose
//
//  Created by Martin Svadlenka on 14.10.2024.
//
import SwiftUI

struct BikeSelectionView: View {
    @State private var selectedBikeType: String? = nil

    var body: some View {
        NavigationStack {
            ScrollView { // Embed in a ScrollView for scrollable content
                VStack {
                    Text("What kind of bike do you want to check?")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    // Direct navigation using tag
                    NavigationLink("Road bike", value: "Road bike")
                        .buttonStyle(PurpleButtonStyle())
                    
                    NavigationLink("Time-trial", value: "Time-trial bike")
                        .buttonStyle(PurpleButtonStyle())
                    
                    NavigationLink("Gravel bike", value: "Gravel bike")
                        .buttonStyle(PurpleButtonStyle())
                    
                    NavigationLink("Mountain bike", value: "Mountain bike")
                        .buttonStyle(PurpleButtonStyle())
                    
                    NavigationLink("Kids bike", value: "Kids bike")
                        .buttonStyle(PurpleButtonStyle())
                    
                    NavigationLink("Other", value: "Other")
                        .buttonStyle(PurpleButtonStyle())
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity) // Center the content in the ScrollView
                .padding()
            }
            .navigationDestination(for: String.self) { bikeType in
                destinationView(for: bikeType)
            }
            .navigationBarTitle("Bike selection", displayMode: .inline)
        }
    }
    
    @ViewBuilder
    private func destinationView(for bikeType: String) -> some View {
        switch bikeType {
            case "Road bike":
                CameraView(bikeType: bikeType)
            case "Time-trial bike":
                CameraView(bikeType: bikeType)
            case "Gravel bike":
                CameraView(bikeType: bikeType)
            case "Mountain bike":
                CameraView(bikeType: bikeType)
            case "Kids bike":
                CameraView(bikeType: bikeType)
            case "Other":
                CameraView(bikeType: bikeType)
            default:
                ComingSoon()
        }
    }
}



