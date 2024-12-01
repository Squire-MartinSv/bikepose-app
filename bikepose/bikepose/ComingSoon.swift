//
//  ComingSoon.swift
//  bikepose
//
//  Created by Martin Svadlenka on 16.10.2024.
//
import SwiftUI

struct ComingSoon: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Upcoming Features")) {
                    FeatureView(title: "Take a Picture Directly from the App", description: "Capture yourself biking directly within the app and have the image automatically optimized for the best angles analysis.")
                    FeatureView(title: "Video Analytics", description: "Analyze the full range of your position angles based on video footage.")
                    FeatureView(title: "More than bikes", description: "Receive position and angle suggestions for not only bikes, but for vehicles like scooter, motorbike and others.")
                }
            }
            .navigationTitle("Features Coming Soon")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct FeatureView: View {
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

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}

