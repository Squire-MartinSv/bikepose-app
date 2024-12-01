//
//  WhatsNew.swift
//  bikepose
//
//  Created by Martin Svadlenka on 30.11.2024.
//
import SwiftUI

struct WhatsNew: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's new?")) {
                    HowTo(title: "Body Lean Angle Measurement", description: "We've added body lean angle measurement and recommendations to the analysis. Now you can get insights into your body's lean angles and receive suggestions for optimal positioning.");
                    HowTo(title: "Improved Photo Guidelines", description: "We've enhanced the descriptions on how to properly take pictures to ensure the best analysis results. Follow the updated guidelines for more accurate pose detection.");
                    HowTo(title: "Additional Bike Types", description: "Various bike types such as gravel and mountain bikes have been added. Select your bike type to receive tailored analysis and recommendations.");
                    HowTo(title: "Customized Angle Recommendations", description: "Optimal angle ranges and recommendations are now customized based on your selected bike type. Get personalized advice suited to your specific riding style.");
                    HowTo(title: "Enhanced Picture Validation", description: "Picture validation has been improved both graphically and systematically to ensure images and objects are properly validated before analysis.");
                    HowTo(title: "Improved Memory Management", description: "We've optimized memory handling to minimize the application's impact on your device's storage. Enjoy a smoother experience with better performance.");
                    HowTo(title: "New 'What's New' Section", description: "A 'What's New' section has been added to inform you about new features in each version. Stay updated with the latest enhancements and updates.");

                }
            }
            .navigationTitle("What's new in this version 1.1.0?")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct WhatsNewItem: View {
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

struct WhatsNew_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNew()
    }
}



