# bikepose-app
Bikepose app repository

BikePose - Bicyclist Body Position Analysis App
Overview
Bikepose is an innovative iOS app developed in Swift that analyzes the body position of bicyclists while riding. This app is designed for integration with Xcode IDE and leverages advanced machine learning models to provide real-time insights into cyclists' postures to enhance performance and reduce the risk of injury.

Features
Analysis of bicyclist body positions.
Utilizes state-of-the-art YOLO models for accurate posture detection.
Getting Started
Prerequisites
macOS with the latest version of Xcode installed.
Swift 5 or later.
iOS 14 or later.
Importing the App into Xcode
Clone the repository to your local machine using:
bash
Copy code
git clone https://github.com/Squire-MartinSv/bikepose-app.git
Open the cloned directory in Xcode by double-clicking the .xcodeproj file or opening Xcode and selecting "Open an existing project" then navigating to the cloned directory.
Setting Up YOLO Models
Due to their large size, YOLO models are not included in this repository. Follow these steps to download and convert YOLO models for use with this app:

Download the desired YOLO model files (.pt format) from the official YOLO repositories:

YOLOv8 Repository
Convert the .pt model files to either .mlmodel or .mlpackage formats suitable for iOS applications. This conversion can be done using tools like CoreML Tools. For guidance on converting model formats, refer to CoreML Tools Documentation.

After conversion, integrate the models into your Xcode project:

Drag and drop the .mlmodel or .mlpackage file into your Xcode project navigator.
Ensure that the model file is included in the "Copy Bundle Resources" section of your app's build phases.
