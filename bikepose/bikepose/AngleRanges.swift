////
////  Untitled.swift
////  bikepose
////
////  Created by Martin Svadlenka on 04.11.2024.
////
//import Foundation
//
//// Struct to hold angle range information for each joint
//struct AngleRange {
//    let jointName: String
//    let minAngle: Double
//    let maxAngle: Double
//    let description: String
//}
//
//// Angle ranges for different joints
//let angleRanges: [AngleRange] = [
//    //Description for RIGHT side of positions
//    AngleRange(jointName: "Right Knee", minAngle: 70, maxAngle: 140, description: "The knee angle varies significantly, but generally, it should not be completely straight when the pedal is at its lowest point; a maximum angle of 140 degrees, minimum of 70 degrees is recommended. Additionally, ensure your knee doesn’t come too close to your chest. Adjustments to knee angle can often be made by altering the seat position."),
//    AngleRange(jointName: "Right Elbow", minAngle: 90, maxAngle: 165, description: "To cushion against terrain bumps, avoid locking your elbows; an optimal bend ranges from 90° to 165°. Lower angle referes to more aggressive position."),
//    AngleRange(jointName: "Right Shoulder-Elbow", minAngle: 70, maxAngle: 95, description: "The recommended angle between the torso, shoulder, and elbow ranges from 70° to 95°, with the elbows slightly bent. Hunched shoulders or overly straight arms may indicate excessive pressure on your hands. Adjustments can be made by modifying the handlebar size."),
//    AngleRange(jointName: "Right Shoulder-Neck", minAngle: 145, maxAngle: 180, description: "This largely depends on rider preference. Generally, avoid tilting your head too far back and aim for a position that feels comfortable."),
//    AngleRange(jointName: "Right Hip", minAngle: 40, maxAngle: 120, description: "The hip angle tends to be smaller for faster, more aggressive riding positions, especially in shorter races; however, it should generally not drop below 40 degrees."),
//    
//    //Description for LEFT side of positions
//    AngleRange(jointName: "Left Knee", minAngle: 70, maxAngle: 140, description: "The knee angle varies significantly, but generally, it should not be completely straight when the pedal is at its lowest point; a maximum angle of 140 degrees, minimum of 70 degrees is recommended. Additionally, ensure your knee doesn’t come too close to your chest. Adjustments to knee angle can often be made by altering the seat position."),
//    AngleRange(jointName: "Left Elbow", minAngle: 90, maxAngle: 165, description: "To cushion against terrain bumps, avoid locking your elbows; an optimal bend ranges from 90° to 165°. Lower angle referes to more aggressive position."),
//    AngleRange(jointName: "Left Shoulder-Elbow", minAngle: 70, maxAngle: 95, description: "The recommended angle between the torso, shoulder, and elbow ranges from 70° to 95°, with the elbows slightly bent. Hunched shoulders or overly straight arms may indicate excessive pressure on your hands. Adjustments can be made by modifying the handlebar size."),
//    AngleRange(jointName: "Left Shoulder-Neck", minAngle: 145, maxAngle: 180, description: "This largely depends on rider preference. Generally, avoid tilting your head too far back and aim for a position that feels comfortable."),
//    AngleRange(jointName: "Left Hip", minAngle: 40, maxAngle: 120, description: "The hip angle tends to be smaller for faster, more aggressive riding positions, especially in shorter races; however, it should generally not drop below 40 degrees.")
//]
//
//// Function to get the angle range for a specific joint by name
//func getAngleRange(for jointName: String) -> AngleRange? {
//    return angleRanges.first { $0.jointName == jointName }
//}
//
