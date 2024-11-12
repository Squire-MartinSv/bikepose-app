import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenLicenseAndTerms") private var hasSeenLicenseAndTerms: Bool = false
    @AppStorage("hasSeenDisclaimer") private var hasSeenDisclaimer: Bool = false
    @State private var showLicenseAndTerms = false
    @State private var showDisclaimer = false

    var body: some View {
        GeometryReader { geometry in
            let isPortrait = geometry.size.height > geometry.size.width

            NavigationView {
                VStack {
                    Spacer()
                    Image("bikepose_logo_png")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, isPortrait ? 20 : 0)
                    
                    Text("Hello biker!")
                        .font(.headline)
                        .padding(.top, isPortrait ? 10 : 0)
                    
                    // Simplified intro text for landscape compatibility
                    Text("Use this app to check your cycling position and get angle information.")
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: isPortrait ? .infinity : geometry.size.width * 0.8)
                    
                    NavigationLink(destination: BikeSelectionView()) {
                        Text("Start analyzing!")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                    .padding()

                    VStack(spacing: 10) {
                        Button(action: {
                            showLicenseAndTerms = true
                        }) {
                            Text("License and Terms")
                                .foregroundColor(.blue)
                                .underline()
                        }
                        
                        Button(action: {
                            showDisclaimer = true
                        }) {
                            Text("Disclaimer")
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .navigationBarTitle("Home", displayMode: .inline)
                .sheet(isPresented: $showLicenseAndTerms) {
                    LicenseTermsView(isFirstLaunch: !hasSeenLicenseAndTerms) {
                        hasSeenLicenseAndTerms = true
                        showLicenseAndTerms = false
                        if !hasSeenDisclaimer {
                            showDisclaimer = true
                        }
                    }
                }
                .sheet(isPresented: $showDisclaimer) {
                    DisclaimerView {
                        hasSeenDisclaimer = true
                        showDisclaimer = false
                    }
                }
                .onAppear {
                    if !hasSeenLicenseAndTerms {
                        showLicenseAndTerms = true
                    } else if !hasSeenDisclaimer {
                        showDisclaimer = true
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct DisclaimerView: View {
    @Environment(\.dismiss) var dismiss
    let onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Disclaimer")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("This app provides general guidance on body positioning for cycling. It is not intended to diagnose, treat, or provide any medical advice. Always consult a medical professional for any health or medical concerns. This app is for informational purposes only.")
                .padding()
                .multilineTextAlignment(.center)
            
            Button(action: {
                onClose()
                dismiss()
            }) {
                Text("I Understand")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .padding()
    }
}

struct LicenseTermsView: View {
    @Environment(\.dismiss) var dismiss
    let isFirstLaunch: Bool
    let onClose: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("License and Terms")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("License Agreement:")
                        .font(.headline)
                        .padding(.top)

                    Text("This app is licensed to you for personal use only. You may not distribute, modify, or reverse-engineer this application. The app is provided “as is” without any guarantees or warranties of any kind. By using this app, you accept these terms.")

                    Text("Terms of Use:")
                        .font(.headline)
                        .padding(.top)

                    Text("The app provides angle measurements for body positioning on a bike for informational purposes only. It should not be used as a substitute for professional advice. The developers are not responsible for any injuries or consequences resulting from using the app.")

                    Text("Legal Notices and Open Source Acknowledgment:")
                        .font(.headline)
                        .padding(.top)

                    Text("""
                    Copyright Notice:
                    This application, "BikePose", uses the YOLOv8 estimation models, which is part of the YOLO (You Only Look Once) open-source project. This model and our modifications to it are available under the GNU Affero General Public License version 3 (AGPLv3).

                    License Details:
                    The YOLOv8 pose model is licensed under the AGPLv3, which allows you to use, modify, and distribute this software under certain conditions. The AGPLv3 is a free, copyleft license suitable for free software.

                    Source Code Availability:
                    In compliance with the AGPLv3, the source code of "BikePose," including all modifications and underlying source code used in this app, can be accessed via our GitHub repository: https://github.com/Squire-MartinSv/bikepose-app.git

                    More about AGPLv3:
                    To see the full text of the AGPLv3 under which the YOLOv8 models and this application are licensed, please visit: https://www.gnu.org/licenses/agpl-3.0.html

                    Disclaimer of Warranty:
                    "BikePose" is provided "AS IS", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and noninfringement. In no event shall the authors, copyright holders, or contributors be liable for any claim, damages, or other liability, whether in an action of contract, tort or otherwise, arising from, out of, or in connection with the software or the use or other dealings in the software.

                    Contribution and Modifications:
                    If you are interested in contributing to the development of "BikePose" or have suggestions for improvements, please visit our GitHub repository. We welcome your input and contributions to this project.
                    """)
                    .padding(.bottom, 20)
                }
                .padding()
            }

            // `Close` button is now always available
            Button(action: {
                onClose()
                dismiss()
            }) {
                Text("Close")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}

