//
//  HowToPicture.swift
//  bikepose
//
//  Created by Martin Svadlenka on 30.11.2024.
//
import SwiftUI

struct HowToPicture: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Ste-by-step guide to take a best picture for pose analysis")) {
                    HowTo(title: "Single Person in Image", description: "Ensure that only one person is present in the picture. This helps the system focus on your pose without distractions from other people, leading to more precise analysis.");
                    HowTo(title: "Clear and Sharp Image", description: "Make sure the picture is clear and not blurry. A sharp image allows the pose detection algorithms to accurately identify your body's key points and angles.");
                    HowTo(title: "Side View Photograph", description: "Take the picture from exactly the right or left side of the bike. Side views provide the best perspective for analyzing your riding posture and position.");
                    HowTo(title: "Select Side for Analysis", description: "Select the side you photographed using the toggle bar below. This tells the system which side to prioritize, ensuring accurate analysis based on the correct viewpoint.");
                    HowTo(title: "Proper Leg Position", description: "Position one leg at its highest point (top of the pedal stroke) and the other leg at its lowest point (bottom of the pedal stroke). This helps analyze your leg extension and knee angles accurately.");
                    HowTo(title: "Follow Guidelines for Accuracy", description: "By following these tips, you'll help the system provide the most accurate pose analysis, leading to better insights and recommendations for your riding posture.");
                }
            }
            .navigationTitle("How to properly take a picture")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct HowTo: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
    }
}

struct HowToPicture_Previews: PreviewProvider {
    static var previews: some View {
        HowToPicture()
    }
}


