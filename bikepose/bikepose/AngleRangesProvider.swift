//
//  AngleRangesProvider.swift
//  bikepose
//
//  Created by Martin Svadlenka on 25.11.2024.
//
import Foundation
import UIKit
import SwiftUI

// Struct to hold angle range information for each joint, with recommendations based on bike type
struct AngleRange {
    let jointName: String
    let bikeSpecificDetails: [String: AngleDetails] // Keyed by bikeType
}

// Struct to hold descriptions and recommendations for a specific bike type
struct AngleDetails {
    let minAngle: Double
    let maxAngle: Double
    let description: String
    let belowMinRecommendation: String
    let aboveMaxRecommendation: String
    let withinRangeRecommendation: String // Optional: for general guidance when within range
}

// Angle ranges for different joints
let angleRanges: [AngleRange] = [
    
    // KNEE ALL OPTIONS--------------------
    AngleRange(
        jointName: "Knee",
        bikeSpecificDetails: [
            "Road bike": AngleDetails(
                minAngle: 70,
                maxAngle: 140,
                description: """
                    When pedaling on a road bike, the knee angle plays a critical role in achieving optimal performance and preventing strain. At the bottom of the pedal stroke, the knee should never fully extend; maintaining a maximum angle of approximately 140 degrees helps ensure efficient power transfer while minimizing stress on the joints and tendons. Conversely, the knee should not bend excessively—keeping a minimum angle of around 70 degrees is crucial to avoid overloading muscles and compromising biomechanical efficiency. Additionally, ensure that your knee remains adequately spaced from your chest to promote a balanced, comfortable riding position and effective breathing.
                    """,
                belowMinRecommendation: """
                    Your knee angle is too small, it indicates excessive bending, which can lead to muscle fatigue and discomfort. To correct this, consider the following adjustments:
                    
                    RAISE THE SADDLE
                    Increase your saddle height to allow for greater leg extension during the pedal stroke. Ensure the adjustment is gradual and doesn’t compromise your reach to the pedals.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly backward to increase the distance between your hips and the pedals, which can help open the knee angle.
                    
                    CHECK CLEAT POSITION
                    Ensure your cleats are correctly positioned on your cycling shoes. Adjusting cleats forward can provide more space for leg extension.
                    
                    REASSES BIKE FIT
                    If adjustments don’t resolve the issue, consult a bike-fitting professional to evaluate your overall setup and ensure your geometry matches your riding style and biomechanics.
                    
                    Always make incremental changes and test the results to ensure a comfortable and efficient pedaling motion.
                    """,
                aboveMaxRecommendation: """
                    Your knee angle is too large, indicating overextension, which can strain joints and reduce pedaling efficiency. To address this, consider the following adjustments:
                    
                    LOWER THE SADDLE
                    Decrease your saddle height to allow for better knee flexion during the pedal stroke. Make gradual changes to avoid compromising comfort and efficiency.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly forward to shorten the distance between your hips and the pedals, reducing the knee angle.
                    
                    CHECK CLEAT POSITION
                    Verify your cleat placement on your cycling shoes. Moving cleats backward can help reduce overextension and bring your knees into a safer range of motion.
                    
                    REASSESS BIKE FIT
                    If these adjustments don’t resolve the issue, consult a bike-fitting professional to ensure your setup is properly aligned with your body mechanics and riding style.
                    
                    Always make small, incremental changes and test your position to maintain a safe and effective riding posture.
                                   
                    """,
                withinRangeRecommendation: """
                    Your knee angle is within the recommended range, ensuring a balanced and efficient pedaling motion. 

                    Factors such as saddle height, saddle position, cleat placement, and overall bike fit all contribute to maintaining this ideal range. Regularly checking these elements and ensuring they are properly adjusted to your body mechanics will help you sustain optimal performance and prevent
                    discomfort or injury.
                                    
                    """
            ),
            "Time-trial bike": AngleDetails(
                minAngle: 70,
                maxAngle: 145,
                description: """
                    When pedaling on a time-trial bike, the knee angle is crucial for balancing aerodynamics, power output, and preventing strain. At the bottom of the pedal stroke, the knee should never fully extend; maintaining a maximum angle of approximately 145 degrees optimizes power transfer while minimizing joint stress. Similarly, avoid excessive bending—keeping a minimum angle of around 70 degrees ensures muscle efficiency without overloading. Proper setup is especially critical on a time-trial bike, where aggressive positioning can affect biomechanics.
                    """,
                belowMinRecommendation: """
                    Your knee angle is too small, indicating excessive bending, which can lead to muscle fatigue and discomfort. To correct this, consider the following adjustments:
                    
                    RAISE THE SADDLE
                    Increase your saddle height to allow for greater leg extension during the pedal stroke. Ensure the adjustment is gradual and doesn’t compromise your aerodynamic position.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly backward to increase the distance between your hips and the pedals, which can help open the knee angle.
                    
                    CHECK CLEAT POSITION
                    Ensure your cleats are correctly positioned on your cycling shoes. Adjusting cleats forward can provide more space for leg extension without affecting pedaling dynamics.
                    
                    REASSESS BIKE FIT
                    If adjustments don’t resolve the issue, consult a bike-fitting professional to evaluate your setup and ensure it accommodates the aggressive positioning typical of time-trial bikes.
                    
                    Always make incremental changes and test the results to ensure a comfortable, efficient, and aerodynamic pedaling motion.
                    """,
                aboveMaxRecommendation: """
                    Your knee angle is too large, indicating overextension, which can strain joints and reduce pedaling efficiency. To address this, consider the following adjustments:
                    
                    LOWER THE SADDLE
                    Decrease your saddle height to allow for better knee flexion during the pedal stroke. Make gradual changes to avoid compromising your aerodynamic position.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly forward to shorten the distance between your hips and the pedals, reducing the knee angle.
                    
                    CHECK CLEAT POSITION
                    Verify your cleat placement on your cycling shoes. Moving cleats backward can help reduce overextension while maintaining a balanced pedal stroke.
                    
                    REASSESS BIKE FIT
                    If these adjustments don’t resolve the issue, consult a bike-fitting professional to ensure your setup aligns with your body mechanics and time-trial-specific requirements.
                    
                    Always make small, incremental changes and test your position to maintain a safe, efficient, and aerodynamic riding posture.
                    """,
                withinRangeRecommendation: """
                    Your knee angle is within the recommended range, ensuring a balanced, efficient, and aerodynamic pedaling motion.

                    Factors such as saddle height, saddle position, cleat placement, and overall bike fit all contribute to maintaining this ideal range. These adjustments are particularly important on a time-trial bike, where position and biomechanics must support both performance and comfort. Regular check
                    help sustain optimal performance and prevent strain.
                    """
            ),
            "Gravel bike": AngleDetails(
                minAngle: 75,
                maxAngle: 135,
                description: """
                    When pedaling on a gravel bike, the knee angle is essential for balancing efficiency, comfort, and stability on varied terrain. At the bottom of the pedal stroke, the knee should not fully extend; maintaining a maximum angle of approximately 135 degrees reduces joint stress and
                    ensures efficient power transfer over long rides. Conversely, the knee should not bend excessively—keeping a minimum angle of around 75 degrees helps prevent muscle fatigue and supports a stable pedaling motion on uneven surfaces.
                    """,
                belowMinRecommendation: """
                    Your knee angle is too small, indicating excessive bending, which can lead to muscle fatigue and discomfort. To correct this, consider the following adjustments:
                    
                    RAISE THE SADDLE
                    Increase your saddle height to allow for greater leg extension during the pedal stroke. Make gradual adjustments to maintain balance and control on varied terrain.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly backward to increase the distance between your hips and the pedals, which can help open the knee angle without compromising stability.
                    
                    CHECK CLEAT POSITION
                    Ensure your cleats are properly positioned on your cycling shoes. Adjusting cleats forward can allow for more space in leg extension, improving comfort during longer rides.
                    
                    REASSESS BIKE FIT
                    If these adjustments don’t resolve the issue, consult a bike-fitting professional to ensure your setup suits the specific demands of gravel riding, including stability and comfort.
                    
                    Always make incremental changes and test the results to ensure an efficient and controlled pedaling motion suitable for rough terrain.
                    """,
                aboveMaxRecommendation: """
                    Your knee angle is too large, indicating overextension, which can strain joints and reduce efficiency, especially on uneven terrain. To address this, consider the following adjustments:
                    
                    LOWER THE SADDLE
                    Decrease your saddle height to allow for better knee flexion during the pedal stroke. Adjust gradually to avoid compromising control or comfort on varied surfaces.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly forward to shorten the distance between your hips and the pedals, reducing the knee angle while maintaining stability.
                    
                    CHECK CLEAT POSITION
                    Verify your cleat placement on your cycling shoes. Moving cleats backward can reduce overextension while supporting a stable pedaling motion over rough terrain.
                    
                    REASSESS BIKE FIT
                    If these adjustments don’t resolve the issue, consult a bike-fitting professional to ensure your setup meets the demands of gravel riding, balancing efficiency with control and comfort.
                    
                    Always make small, incremental changes and test your position to maintain a safe and effective pedaling posture for varied terrain.
                    """,
                withinRangeRecommendation: """
                    Your knee angle is within the recommended range, ensuring efficient, comfortable, and stable pedaling motion over varied terrain.

                    Factors such as saddle height, saddle position, cleat placement, and overall bike fit all contribute to maintaining this ideal range. Regularly check these elements, as gravel riding often involves long distances and rough surfaces where proper alignment is key to avoiding discomfort
                    and maximizing performance.
                    """
            ),
            "Mountain bike": AngleDetails(
                minAngle: 75,
                maxAngle: 130,
                description: """
                    When pedaling on a mountain bike (typically cross-country) with a high saddle position, the knee angle is critical for efficiency, control, and comfort on challenging terrain. At the bottom of the pedal stroke, the knee should not fully extend; maintaining a maximum angle of approximately 130 degrees ensures efficient power transfer while minimizing joint stress. Conversely, the knee should not bend excessively—keeping a minimum angle of around 75 degrees helps avoid muscle fatigue and supports stability during technical climbs and descents.
                    """,
                belowMinRecommendation: """
                    Your knee angle is too small, indicating excessive bending, which can lead to muscle fatigue and discomfort. To correct this, consider the following adjustments:
                    
                    RAISE THE SADDLE
                    Increase your max saddle height to allow for greater leg extension during the pedal stroke. In case you use telescopic saddle bar, make sure top position is stable and correspond with optimal height for paddling. Make gradual adjustments to avoid compromising balance and control on technical terrain.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly backward to increase the distance between your hips and the pedals, helping to open the knee angle while maintaining stability.
                    
                    CHECK CLEAT POSITION
                    Ensure your cleats are correctly positioned on your cycling shoes. Adjusting cleats forward can provide more space for leg extension, improving comfort during long climbs and descents.
                    
                    Always make incremental changes and test the results to ensure an efficient and stable pedaling motion suitable for off-road conditions.
                    """,
                aboveMaxRecommendation: """
                    Your knee angle is too large, indicating overextension, which can strain joints and reduce efficiency, particularly on rough terrain. To address this, consider the following adjustments:
                    
                    LOWER THE SADDLE
                    Decrease your saddle height to allow for better knee flexion during the pedal stroke. In case you use telescopic saddle bar, make sure top position is stable and correspond with optimal height for paddling. Make gradual adjustments to avoid compromising stability or pedaling efficiency on technical trails.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly forward to shorten the distance between your hips and the pedals, reducing the knee angle without affecting control.
                    
                    CHECK CLEAT POSITION
                    Verify your cleat placement on your cycling shoes. Moving cleats backward can reduce overextension while maintaining a balanced and efficient pedaling motion over varied terrain.
                    
                    Always make small, incremental changes and test your position to maintain a safe, effective, and controlled pedaling posture on rugged terrain.
                    """,
                withinRangeRecommendation: """
                    Your knee angle is within the recommended range, ensuring an efficient, comfortable, and stable pedaling motion for cross-country mountain biking.

                    Factors such as saddle height, saddle position, cleat placement, and overall bike fit all contribute to maintaining this ideal range. Regularly check these elements, as mountain biking often involves technical climbs, descents, and varying terrain where proper alignment is crucial for performance and injury prevention.
                    """
            ),
            "Kids bike": AngleDetails(
                minAngle: 70,
                maxAngle: 140,
                description: """
                    When pedaling on a kids' bike, the knee angle is crucial for ensuring comfort, safety, and efficient pedaling. At the bottom of the pedal stroke, the knee should not fully extend; maintaining a maximum angle of approximately 140 degrees helps avoid strain on growing joints. Conversely, the knee should not bend excessively—keeping a minimum angle of around 70 degrees prevents discomfort and ensures proper pedaling mechanics. Note that children often outgrow their bikes quickly, so if the recommended range cannot be achieved through adjustments, it may be time for a larger bike.
                    """,
                belowMinRecommendation: """
                    Your child's knee angle is too small (even for kids where the minimal angle is slightly lower than for adults), indicating excessive bending, which can lead to discomfort or difficulty pedaling. To correct this, consider the following adjustments:
                    
                    RAISE THE SADDLE
                    Increase the saddle height to allow for greater leg extension during the pedal stroke. Make small adjustments to ensure the child can still place their feet safely on the ground while stationary.

                    ADJUST SADDLE POSITION
                    Move the saddle slightly backward to increase the distance between the hips and pedals, helping to open the knee angle. Ensure this change doesn’t compromise the child’s ability to comfortably reach the handlebars.

                    CHECK BIKE SIZE
                    If the adjustments don’t bring the knee angle within the recommended range, the bike may be too small for the child. Consider moving to the next size up to ensure a proper fit and safe riding experience.

                    CHECK FEET POSITION  
                    Ensure the child’s feet are properly placed on the pedals, with the ball of the foot positioned over the pedal spindle. Incorrect foot placement, such as using the arch or heel, can affect knee angles, reduce pedaling efficiency, and lead to discomfort. Encourage proper technique to support
                    safe and effective riding.  

                    Always ensure any changes maintain the child’s safety and comfort while riding. Test adjustments incrementally to find the most suitable position.
                    """,
                aboveMaxRecommendation: """
                    Your child's knee angle is too large, indicating overextension, which can strain joints and reduce control while pedaling. To address this, consider the following adjustments:
                    
                    LOWER THE SADDLE
                    Decrease the saddle height to allow for better knee flexion during the pedal stroke. Ensure the child can comfortably reach the ground when stationary.

                    ADJUST SADDLE POSITION
                    Move the saddle slightly forward to reduce the distance between the hips and pedals, bringing the knee angle into a safer range while maintaining comfort and control.

                    CHECK BIKE SIZE
                    If adjustments don’t resolve the issue, the bike may be too large for the child. Ensure the child is riding a bike appropriate for their size to avoid overextension and maintain safe handling.

                    CHECK FEET POSITION  
                    Ensure the child’s feet are properly placed on the pedals, with the ball of the foot positioned over the pedal spindle. Incorrect foot placement, such as using the arch or heel, can affect knee angles, reduce pedaling efficiency, and lead to discomfort. Encourage proper technique to support
                    safe and effective riding. 

                    Always prioritize the child’s safety and comfort when making adjustments, and test changes gradually to achieve a proper fit.
                    """,
                withinRangeRecommendation: """
                    Your child's knee angle is within the recommended range, ensuring a safe, comfortable, and efficient pedaling motion.

                    Factors such as saddle height, saddle position, bike size, and feet position on the pedal all contribute to maintaining this ideal range. Regularly check these elements, especially as children grow quickly and may outgrow their current bike. Ensuring a proper fit supports healthy development and an enjoyable riding experience.
                    """
            ),
            "Other": AngleDetails(
                minAngle: 75,
                maxAngle: 140,
                description: """
                    For all types of bikes, maintaining the correct knee angle is essential for efficient, comfortable, and safe pedaling. At the bottom of the pedal stroke, the knee should not fully extend; a maximum angle of approximately 140 degrees helps minimize stress on the joints and tendons while ensuring effective power transfer. Similarly, avoid excessive bending by maintaining a minimum angle of around 75 degrees to prevent muscle fatigue and discomfort. Proper adjustments to the bike setup are key to achieving the recommended range across different bike types and riding styles.
                    """,
                belowMinRecommendation: """
                    Your knee angle is too small, indicating excessive bending, which can lead to muscle fatigue, discomfort, and reduced pedaling efficiency. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Increase the saddle height to allow for greater leg extension during the pedal stroke. Make gradual changes to ensure comfort and proper control of the bike.

                    ADJUST SADDLE POSITION  
                    Move the saddle slightly backward to increase the distance between your hips and the pedals, helping to open the knee angle while maintaining a balanced riding posture.

                    CHECK BIKE SIZE  
                    Ensure the bike is the correct size for the rider. If the adjustments don’t resolve the issue, the bike may be too small and require upgrading to a larger frame.

                    CHECK FEET POSITION  
                    Confirm the feet are properly placed on the pedals, with the ball of the foot positioned over the pedal spindle. Improper placement can affect knee angles and pedaling efficiency.

                    Always prioritize comfort and efficiency while making adjustments. Test changes incrementally to achieve a safe and effective pedaling motion suitable for the rider’s bike and style.
                    """,
                aboveMaxRecommendation: """
                    Your knee angle is too large, indicating overextension, which can strain joints and reduce pedaling efficiency. To resolve this issue, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Decrease the saddle height to allow for better knee flexion during the pedal stroke. Make gradual changes to maintain comfort and control of the bike.

                    ADJUST SADDLE POSITION  
                    Move the saddle slightly forward to shorten the distance between your hips and the pedals, reducing the knee angle without compromising stability or pedaling efficiency.

                    CHECK BIKE SIZE  
                    Verify that the bike is the correct size for the rider. If adjustments don’t solve the issue, the bike may be too large and require switching to a smaller frame.

                    CHECK FEET POSITION  
                    Ensure the feet are correctly placed on the pedals, with the ball of the foot over the pedal spindle. Incorrect placement can lead to overextension and reduced control.

                    Always prioritize safety and comfort when making adjustments, and test changes incrementally to maintain a proper and efficient pedaling posture.
                    """,
                withinRangeRecommendation: """
                    Your knee angle is within the recommended range, ensuring a balanced, efficient, and comfortable pedaling motion across various bike types.

                    Factors such as saddle height, saddle position, bike size, and feet position all contribute to maintaining this ideal range. Regularly check these elements to ensure they remain aligned with the rider’s body mechanics and style of riding. Proper adjustments support long-term comfort, performance, and injury prevention.
                    """
            )
        ]
    ),
    
    // ----------------------------------------------------------------------- ELBOW - ALL OPTIONS---------------------------------------------------------------------------
    AngleRange(
        jointName: "Elbow",
        bikeSpecificDetails: [
            "Road bike": AngleDetails(
                minAngle: 90,
                maxAngle: 165,
                description: """
                    When riding a road bike, the elbow angle plays a significant role in maintaining comfort, control, and aerodynamics. Ideally, your elbows should be slightly bent, with an angle between 90 and 165 degrees. This range allows for effective shock absorption while ensuring you maintain a stable and aerodynamic riding position. Fully locking out your elbows can lead to discomfort and reduced control, while excessive bending can compromise aerodynamics and create unnecessary tension in the arms and shoulders.
                    """,
                belowMinRecommendation: """
                    Your elbow angle is too small, indicating excessive bending, which can lead to arm fatigue and tension in your shoulders. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to allow for a more extended arm position. Ensure that this adjustment doesn’t compromise your ability to reach the controls comfortably.

                    CHECK HANDLEBAR WIDTH  
                    If the handlebars are too narrow for your shoulder width, it may force your elbows into an overly bent position. Consider switching to wider handlebars for a more natural arm placement.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Excessive bending may indicate you’re hunching or leaning too far forward. Adjust your saddle and handlebar positions to promote a balanced, relaxed posture.
                    
                    OTHER ADJUSTMENTS
                    Also handlebar tilt or seat position may affect the elbow angle. Try slightly adjust those to optimize elbow angle.

                    Always test changes incrementally to find a position that balances comfort, control, and aerodynamics.
                    """,
                aboveMaxRecommendation: """
                    Your elbow angle is too large, indicating overextension, which can reduce shock absorption and compromise control. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more relaxed arm bend. Ensure the adjustment maintains an aerodynamic position without sacrificing comfort.

                    CHECK HANDLEBAR REACH  
                    If the handlebars are too far from your body, they may cause you to overextend your arms. Shortening the stem or choosing handlebars with a shorter reach can help reduce the elbow angle.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Overextension may indicate you’re sitting too upright or reaching too far forward. Adjust your saddle and handlebars to maintain a more natural position.
                    
                    OTHER ADJUSTMENTS
                    Also handlebar tilt or seat position may affect the elbow angle. Try slightly adjust those to optimize elbow angle.

                    Always make small, incremental adjustments to ensure a comfortable and stable riding posture.
                    """,
                withinRangeRecommendation: """
                    Your elbow angle is within the recommended range, ensuring a comfortable, controlled, and aerodynamic riding position.

                    Factors such as handlebar position, handlebar width, seat position, handlebar tilt and overall posture contribute to maintaining this ideal range. Regularly check these elements to ensure your setup remains optimized for comfort, control, and performance during long rides.
                    """
            ),
            "Time-trial bike": AngleDetails(
                minAngle: 90,
                maxAngle: 105,
                description: """
                    When riding a time-trial bike, the elbow angle is crucial for achieving an aerodynamic and efficient position. Ideally, the elbows should be bent at an angle between 90 and 105 degrees, allowing you to maintain a streamlined position while supporting your weight on the aero bars. This specific range helps distribute pressure evenly, prevents overloading the arms and shoulders, and supports efficient power output. Incorrect elbow angles can lead to discomfort, reduced control, and compromised aerodynamics during prolonged efforts.
                    """,
                belowMinRecommendation: """
                    Your elbow angle is too small, indicating excessive bending, which can lead to tension in your arms and shoulders, reducing comfort and stability. To correct this, consider the following adjustments:
                    
                    ADJUST AERO BAR EXTENSIONS  
                    Lengthen the aero bar extensions to create more space for your arms and allow for a slightly straighter elbow position. Ensure the adjustment doesn’t affect your ability to maintain control or reach the shifters.

                    CHECK ARMREST POSITION  
                    Move the armrests slightly forward to encourage a more relaxed bend in the elbows. This adjustment can also help reduce pressure on the shoulders.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Excessive bending may indicate you're too far forward or hunched. Adjust your saddle position or aero bar tilt to achieve a more balanced, relaxed posture.

                    OTHER ADJUSTMENTS  
                    Adjusting the aero bar tilt or fine-tuning the saddle height and fore-aft position can also affect elbow angle. Test these elements to find an optimal setup.

                    Always test changes incrementally to ensure comfort, control, and an aerodynamic position suitable for time-trial riding.
                    """,
                aboveMaxRecommendation: """
                    Your elbow angle is too large, indicating overextension, which can lead to reduced aerodynamics, instability, and discomfort during long rides. To address this, consider the following adjustments:
                    
                    ADJUST AERO BAR EXTENSIONS  
                    Shorten the aero bar extensions to bring your elbows closer to the recommended angle. Ensure the adjustment doesn’t compromise your ability to hold a steady position on the aero bars.

                    CHECK ARMREST POSITION  
                    Move the armrests slightly backward to encourage a deeper bend in the elbows, improving stability and maintaining aerodynamic efficiency.

                    REASSESS RIDING POSITION  
                    Evaluate your posture on the bike. Overextension may indicate you are sitting too far back or upright. Adjust your saddle position or aero bar tilt to achieve a more forward, streamlined posture.

                    OTHER ADJUSTMENTS  
                    Adjusting the aero bar tilt or seat position may help fine-tune your elbow angle and improve overall fit.

                    Always make small, incremental adjustments to maintain a stable, aerodynamic, and comfortable riding posture specific to time-trial conditions.
                    """,
                withinRangeRecommendation: """
                    Your elbow angle is within the recommended range, ensuring a stable, aerodynamic, and efficient riding position for time-trial performance.

                    Factors such as aero bar extensions, armrest position, saddle height, aero bar tilt, and overall posture all contribute to maintaining this ideal range. Regularly check these elements to ensure your setup remains optimized for comfort, control, and maximum aerodynamics during time trials or triathlons.
                    """
            ),
            "Gravel bike": AngleDetails(
                minAngle: 90,
                maxAngle: 165,
                description: """
                    When riding a gravel bike, the elbow angle plays a key role in balancing comfort, control, and stability on varied terrain. Like on a road bike, the elbows should be slightly bent, with an angle between 90 and 165 degrees. This range allows for effective shock absorption, better handling on uneven surfaces, and sustained comfort during long rides. Fully locking your elbows can lead to discomfort and reduced control, while excessive bending can increase fatigue and tension in the arms and shoulders, particularly on rough terrain.
                    """,
                belowMinRecommendation: """
                    Your elbow angle is too small, indicating excessive bending, which can lead to arm fatigue and tension in your shoulders, especially on long or rough rides. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to allow for a more extended arm position. Ensure the adjustment doesn’t compromise your ability to handle the bike effectively on uneven terrain.

                    CHECK HANDLEBAR WIDTH  
                    Gravel bikes often benefit from wider handlebars for better control on technical terrain. If your handlebars are too narrow, they may force your elbows into an overly bent position. Consider switching to flared or wider handlebars for added stability.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Excessive bending may indicate you're leaning too far forward or hunching. Adjust your saddle and handlebar positions to promote a balanced, relaxed posture suitable for gravel riding.

                    OTHER ADJUSTMENTS  
                    Handlebar tilt, seat position, and stem length can also affect the elbow angle. Make incremental changes to these components to optimize comfort and control.

                    Always test changes incrementally to ensure your position supports both control and endurance for varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your elbow angle is too large, indicating overextension, which can reduce shock absorption and compromise control, particularly on rough terrain. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more relaxed arm bend. Ensure the adjustment doesn’t interfere with your ability to maintain a stable position on uneven surfaces.

                    CHECK HANDLEBAR REACH  
                    If the handlebars are too far from your body, they may cause you to overextend your arms. Shortening the stem or choosing handlebars with a shorter reach can help reduce the elbow angle while maintaining effective handling.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Overextension may indicate you’re sitting too upright or too far back. Adjust your saddle and handlebar positions to maintain a natural, balanced position suited for gravel riding.

                    OTHER ADJUSTMENTS  
                    Adjust the handlebar tilt or fore-aft seat position to fine-tune your elbow angle. These small changes can significantly improve both control and comfort.

                    Always make small, incremental adjustments to ensure a stable and effective riding posture for varied gravel terrain.
                    """,
                withinRangeRecommendation: """
                    Your elbow angle is within the recommended range, ensuring a comfortable, controlled, and stable riding position for gravel adventures.

                    Factors such as handlebar position, handlebar width, seat position, handlebar tilt, and overall posture all contribute to maintaining this ideal range. Regularly check these elements, as gravel riding often involves long distances and rough surfaces where proper alignment is key to comfort, control, and performance.
                    """
            ),
            "Mountain bike": AngleDetails(
                minAngle: 80,
                maxAngle: 170,
                description: """
                    When riding a mountain bike, the elbow angle is crucial for maintaining control, comfort, and responsiveness on varied and technical terrain. Unlike other bike types, elbow angles on mountain bikes can vary significantly depending on the riding style, such as cross-country, trail, or downhill. Generally, the elbows should remain slightly bent, with an angle between 80 and 170 degrees. This range allows for shock absorption, improved bike handling, and better weight distribution. Fully locking your elbows can reduce control and increase fatigue, while excessive bending may compromise stability and lead to arm fatigue on extended rides.
                    """,
                belowMinRecommendation: """
                    Your elbow angle is too small, indicating excessive bending, which can lead to arm fatigue and reduce your ability to handle technical terrain effectively. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to encourage a more extended arm position. Ensure the adjustment doesn’t hinder your ability to control the bike, especially on steep descents or technical sections.

                    CHECK HANDLEBAR WIDTH  
                    Mountain bikes often require wider handlebars for better control. If your handlebars are too narrow, they may force your elbows into an overly bent position. Wider bars can provide a more natural arm placement and improve handling.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Excessive bending may indicate you’re leaning too far forward or hunching your shoulders. Adjust your saddle and handlebar positions to promote a balanced and relaxed posture.

                    OTHER ADJUSTMENTS  
                    Handlebar tilt, stem length, and seat position can all influence elbow angles. Small adjustments to these components can help optimize comfort and control for mountain biking.

                    Always make incremental adjustments to ensure your position supports control, shock absorption, and comfort across varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your elbow angle is too large, indicating overextension, which can reduce shock absorption, compromise control, and increase fatigue. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more relaxed arm bend. Ensure the adjustment maintains your ability to navigate technical terrain with confidence.

                    CHECK HANDLEBAR REACH  
                    If the handlebars are too far from your body, they may cause overextension of your arms. Shortening the stem or choosing handlebars with a shorter reach can help reduce the elbow angle and improve control.

                    REASSESS RIDING POSITION  
                    Evaluate your posture on the bike. Overextension may indicate you’re sitting too upright or too far back. Adjust your saddle and handlebars to create a more forward, aggressive posture suitable for mountain biking.

                    OTHER ADJUSTMENTS  
                    Adjusting the handlebar tilt, saddle fore-aft position, or stem angle can help fine-tune your elbow angle for better handling and stability.

                    Always make small, incremental changes to achieve a comfortable and stable position, particularly for the technical demands of mountain biking.
                    """,
                withinRangeRecommendation: """
                    Your elbow angle is within the recommended range, ensuring a comfortable, controlled, and responsive riding position suitable for mountain biking.

                    Factors such as handlebar position, handlebar width, seat position, handlebar tilt, and overall posture contribute to maintaining this ideal range. Regularly check these elements, as mountain biking involves varied terrain and riding styles where proper alignment is key to performance, control, and injury prevention.
                    """
            ),
            "Kids bike": AngleDetails(
                minAngle: 85,
                maxAngle: 150,
                description: """
                    On a kids' bike, the elbow angle is essential for maintaining comfort, control, and safety while riding. Ideally, the elbows should be bent at an angle between 85 and 150 degrees, allowing for effective steering and shock absorption while ensuring the rider can easily manage the bike. Fully locking the elbows can reduce control and lead to discomfort, while excessive bending may cause fatigue or limit the child’s ability to maneuver the bike properly. Proper setup and posture adjustments are particularly important as children grow and may outgrow their bikes quickly.
                    """,
                belowMinRecommendation: """
                    Elbow angle is too small, indicating excessive bending, which can lead to arm fatigue and reduced control of the bike. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to encourage a more extended arm position. Ensure the child can still comfortably reach the handlebars and controls.

                    CHECK HANDLEBAR WIDTH  
                    Ensure the handlebars are appropriate for the child's shoulder width. Narrow handlebars can force an overly bent elbow position, while wider handlebars promote better arm placement and control.

                    REASSESS RIDING POSITION  
                    Evaluate the child’s posture on the bike. Excessive bending may indicate the child is leaning too far forward. Adjust the saddle and handlebars to promote a balanced, comfortable riding posture.

                    CHECK BIKE SIZE  
                    If adjustments don’t resolve the issue, the bike may be too small for the child. Consider upgrading to a larger size to ensure proper fit and control.

                    OTHER ADJUSTMENTS  
                    Handlebar tilt and stem length can also influence elbow angles. Make small changes to improve comfort and adjustability for the child’s riding style.

                    Always test changes incrementally to ensure a safe and stable riding position for your child.
                    """,
                aboveMaxRecommendation: """
                    Elbow angle is too large, indicating overextension, which can reduce control, shock absorption, and comfort while riding. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more relaxed arm bend. Ensure the adjustment allows the child to maintain proper control of the bike.

                    CHECK HANDLEBAR REACH  
                    If the handlebars are too far from the child’s body, they may cause overextension. Shortening the stem or adjusting the handlebars closer can reduce the elbow angle and improve maneuverability.

                    REASSESS RIDING POSITION  
                    Evaluate the child’s posture on the bike. Overextension may indicate the child is sitting too upright or the bike is too large. Adjust the saddle and handlebar positions to create a more balanced posture.

                    CHECK BIKE SIZE  
                    If adjustments don’t resolve the issue, the bike may be too large for the child. Ensure the bike is the correct size for the child’s height and reach.

                    OTHER ADJUSTMENTS  
                    Adjusting the handlebar tilt or stem length can help fine-tune the elbow angle and improve overall fit and comfort.

                    Always make small, incremental adjustments to ensure a safe and comfortable riding posture for your child.
                    """,
                withinRangeRecommendation: """
                    Your child's elbow angle is within the recommended range, ensuring a comfortable, controlled, and safe riding position.

                    Factors such as handlebar position, handlebar width, seat position, and overall posture all contribute to maintaining this ideal range. Regularly check these elements, as children grow quickly and may outgrow their bikes, requiring adjustments or a larger bike for proper fit and safety.
                    """
            ),
            "Other": AngleDetails(
                minAngle: 85,
                maxAngle: 160,
                description: """
                    For all types of bikes, maintaining a proper elbow angle is essential for comfort, control, and safety. The ideal range for the elbow angle is between 85 and 160 degrees, providing flexibility across different riding styles and bike types. A slightly bent elbow allows for effective shock absorption, better handling, and reduced strain on the arms and shoulders. Fully locked elbows can lead to discomfort and instability, while excessive bending can cause fatigue and limit control, particularly on varied terrain or during extended rides.
                    """,
                belowMinRecommendation: """
                    Your elbow angle is too small, indicating excessive bending, which can lead to arm fatigue and reduced control of the bike. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to encourage a more extended arm position. Ensure this adjustment does not compromise your ability to handle the bike comfortably or safely.

                    CHECK HANDLEBAR WIDTH  
                    Handlebar width should align with your shoulder width. Narrow handlebars can force an overly bent elbow position, while wider handlebars support a more natural arm placement and improved control.

                    REASSESS RIDING POSITION  
                    Evaluate your overall posture on the bike. Excessive bending may indicate you’re leaning too far forward or hunching. Adjust the saddle and handlebar positions to promote a balanced and relaxed riding posture.

                    OTHER ADJUSTMENTS  
                    Handlebar tilt, stem length, and seat position can also influence elbow angles. Make incremental changes to improve comfort and control.

                    Always test adjustments incrementally to find a position that supports control, comfort, and riding efficiency.
                    """,
                aboveMaxRecommendation: """
                    Your elbow angle is too large, indicating overextension, which can reduce control, shock absorption, and comfort while riding. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more relaxed arm bend. Ensure the adjustment maintains your ability to control the bike effectively.

                    CHECK HANDLEBAR REACH  
                    If the handlebars are too far from your body, they may cause overextension. Shortening the stem or choosing handlebars with a shorter reach can help reduce the elbow angle and improve handling.

                    REASSESS RIDING POSITION  
                    Evaluate your posture on the bike. Overextension may indicate you’re sitting too upright or too far back. Adjust your saddle and handlebar positions to create a more balanced posture.

                    OTHER ADJUSTMENTS  
                    Adjust the handlebar tilt or stem length to fine-tune your elbow angle. These small changes can significantly improve both control and comfort.

                    Always make small, incremental changes to ensure a comfortable and effective riding posture across various bike types and conditions.
                    """,
                withinRangeRecommendation: """
                    Your elbow angle is within the recommended range, ensuring a comfortable, controlled, and stable riding position suitable for a variety of bike types.

                    Factors such as handlebar position, handlebar width, seat position, handlebar tilt, and overall posture all contribute to maintaining this ideal range. Regularly check these elements, as different riding styles and terrain may require minor adjustments to optimize comfort, control, and performance.
                    """
            )
        ]
    ),

    //Shoulder-Elbow ALL OPTIONS -------------------------
    AngleRange(
        jointName: "Shoulder-Elbow",
        bikeSpecificDetails: [
            "Road bike": AngleDetails(
                minAngle: 70,
                maxAngle: 95,
                description: """
                    On a road bike, the shoulder-elbow angle, which measures the angle between your torso, shoulder, and elbow, is critical for maintaining an aerodynamic, efficient, and comfortable riding position. Ideally, this angle should range between 70 and 95 degrees, providing the right balance of forward reach and support. A smaller angle can result in excessive compactness, restricting movement and creating tension, while a larger angle may indicate an overly upright posture that compromises aerodynamics and pedaling efficiency. All this is considered for standard handlebars held.
                    """,
                belowMinRecommendation: """
                    Your shoulder-elbow angle is too small, indicating that your elbows are too close to your torso, which can create a cramped position and lead to restricted movement or tension in your arms and shoulders. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to increase the reach and encourage a more open position. This adjustment helps to reduce strain and promote better weight distribution.

                    CHECK STEM LENGTH  
                    A stem that is too short can force your elbows into a compact position. Switching to a longer stem can help extend your reach and open up your shoulder-elbow angle.

                    REASSESS SADDLE POSITION  
                    Move the saddle slightly backward to encourage a more extended posture and reduce the angle at the torso-shoulder-elbow junction.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of your handlebars or reduce spacer height under the stem to refine your position and improve arm extension.

                    Always test changes incrementally to ensure a comfortable and efficient riding posture.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-elbow angle is too large, indicating that your elbows are too far from your torso, leading to an overly upright position. This can reduce aerodynamics and pedaling efficiency. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more compact and aerodynamic position. Ensure this adjustment maintains comfort and control.

                    CHECK STEM LENGTH  
                    A stem that is too long may contribute to overextension. Switching to a shorter stem can help bring the handlebars closer and reduce the shoulder-elbow angle.

                    REASSESS SADDLE POSITION  
                    Move the saddle slightly forward to shift your weight and encourage a more compact riding position.

                    OTHER ADJUSTMENTS  
                    Adjusting the handlebar tilt or adding spacers under the stem can help refine the shoulder-elbow angle to within the recommended range.

                    Always make small, incremental changes to maintain an aerodynamic, comfortable, and efficient position.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-elbow angle is within the recommended range, ensuring a balanced, comfortable, and aerodynamic riding posture.

                    Factors such as handlebar position, stem length, saddle position, and overall posture all contribute to maintaining this ideal range. Regularly check these elements to ensure your setup remains optimized for comfort, control, and performance during long rides.
                    """
            ),
            "Time-trial bike": AngleDetails(
                minAngle: 75,
                maxAngle: 95,
                description: """
                    On a time-trial bike, the shoulder-elbow angle, measuring the angle between your torso, shoulder, and elbow, is critical for achieving maximum aerodynamic efficiency and comfort during prolonged efforts. This angle should remain close to 90 degrees, ideally between 85 and 95 degrees. A smaller angle can lead to a cramped position, restricting movement and causing tension, while a larger angle may compromise aerodynamics and reduce power transfer. Proper setup is essential to maintain a streamlined and sustainable posture.
                    """,
                belowMinRecommendation: """
                    Your shoulder-elbow angle is too small, indicating that your elbows are too close to your torso, which can create a cramped position and cause discomfort or reduced breathing efficiency. To address this, consider the following adjustments:
                    
                    ADJUST AERO BAR EXTENSIONS  
                    Lengthen the aero bar extensions to create more space between your torso and elbows, promoting a more open and relaxed position.

                    CHECK ARMREST POSITION  
                    Move the armrests slightly forward to encourage a greater reach and reduce the compactness of your position.

                    REASSESS SADDLE POSITION  
                    Move the saddle slightly forward to allow your torso to extend naturally into the aero position without forcing your elbows into a cramped angle.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of the aero bars slightly upward or refine the spacer height under the aero bar mounts to optimize the shoulder-elbow angle.

                    Always make small, incremental adjustments to ensure comfort and maintain aerodynamic efficiency.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-elbow angle is too large, indicating that your elbows are too far from your torso, which can lead to a less aerodynamic posture and reduced stability. To correct this, consider the following adjustments:
                    
                    ADJUST AERO BAR EXTENSIONS  
                    Shorten the aero bar extensions to bring your elbows closer to your torso, improving aerodynamics and stability.

                    CHECK ARMREST POSITION  
                    Move the armrests slightly backward to encourage a more compact and efficient riding position.

                    REASSESS SADDLE POSITION  
                    Move the saddle slightly backward to balance your weight distribution and naturally reduce the shoulder-elbow angle.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of the aero bars slightly downward or add spacers under the aero bar mounts to fine-tune the angle to within the recommended range.

                    Always test changes incrementally to ensure a balanced and efficient aero position without compromising comfort.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-elbow angle is within the recommended range, ensuring a stable, aerodynamic, and efficient position for time-trial performance.

                    Factors such as aero bar extensions, armrest position, saddle position, and overall posture all contribute to maintaining this ideal range. Regularly check these elements to ensure your setup remains optimized for comfort, control, and maximum aerodynamics during time trials or triathlons.
                    """
            ),
            "Gravel bike": AngleDetails(
                minAngle: 70,
                maxAngle: 95,
                description: """
                    On a gravel bike, the shoulder-elbow angle, which measures the angle between your torso, shoulder, and elbow, plays a key role in maintaining comfort, control, and stability on mixed terrain. This angle should typically range between 70 and 95 degrees, providing the flexibility to adapt to rough surfaces while maintaining an efficient and comfortable riding posture. A smaller angle can lead to excessive compactness and restricted movement, while a larger angle may result in reduced control and compromised efficiency on uneven terrain.
                    """,
                belowMinRecommendation: """
                    Your shoulder-elbow angle is too small, indicating that your elbows are too close to your torso. This can create a cramped position, restrict movement, and reduce your ability to absorb shocks effectively. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to create more reach, promoting a more open and balanced position that accommodates varied terrain.

                    CHECK STEM LENGTH  
                    A stem that is too short can force a compact posture. Consider switching to a longer stem to increase the reach and open up the shoulder-elbow angle.

                    REASSESS SADDLE POSITION  
                    Move the saddle slightly backward to shift your weight and naturally extend your torso and arms into a more comfortable position.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of your handlebars or reduce spacer height under the stem to refine your position and improve arm extension for better handling on gravel.

                    Always test changes incrementally to ensure a stable, comfortable, and shock-absorbing riding posture.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-elbow angle is too large, indicating that your elbows are too far from your torso. This can lead to an overly upright position, reducing control and stability, especially on rough terrain. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more compact position, improving stability and responsiveness on uneven surfaces.

                    CHECK STEM LENGTH  
                    A stem that is too long can cause overextension. Switching to a shorter stem can help reduce the shoulder-elbow angle and improve your handling on technical terrain.

                    REASSESS SADDLE POSITION  
                    Move the saddle slightly forward to balance your weight distribution and encourage a more compact, stable riding position.

                    OTHER ADJUSTMENTS  
                    Adjusting the handlebar tilt or adding spacers under the stem can help bring the angle into the recommended range while maintaining comfort and control.

                    Always make small, incremental changes to maintain a comfortable and controlled position suitable for mixed terrain and long rides.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-elbow angle is within the recommended range, ensuring a comfortable, controlled, and efficient riding position for gravel adventures.

                    Factors such as handlebar position, stem length, saddle position, and overall posture all contribute to maintaining this ideal range. Regularly check these elements, as gravel riding often involves varied terrain where proper alignment is key to control, stability, and endurance.
                    """
            ),
            "Mountain bike": AngleDetails(
                minAngle: 65,
                maxAngle: 100,
                description: """
                    On a mountain bike, the shoulder-elbow angle, which measures the angle between your torso, shoulder, and elbow, is critical for maintaining control, stability, and comfort on technical and varied terrain (considered while sitting on the saddle). This angle typically ranges between 65 and 100 degrees, depending on the type of mountain biking (e.g., cross-country, trail, or downhill). A smaller angle provides a more compact position for technical handling, while a larger angle is better suited for long climbs or smoother trails. Maintaining the correct angle allows for effective shock absorption and responsiveness while avoiding discomfort or fatigue.
                    """,
                belowMinRecommendation: """
                    Your shoulder-elbow angle is too small, indicating that your elbows are too close to your torso. This can result in a cramped position, restricted movement, and reduced ability to absorb shocks effectively on rough terrain. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to create more reach, promoting an open position that supports better handling and shock absorption.

                    CHECK STEM LENGTH  
                    A short stem may force your posture into a compact position. Switching to a slightly longer stem can help extend the reach and open up the shoulder-elbow angle.

                    REASSESS HANDLEBAR WIDTH  
                    Narrow handlebars can lead to excessive compactness and limit control. Consider wider handlebars, which are common on mountain bikes, to enhance stability and arm positioning.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of your handlebars or reduce spacer height under the stem to refine your position and improve arm extension for better handling in technical sections.

                    Always test changes incrementally to ensure stability, control, and comfort on varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-elbow angle is too large, indicating that your elbows are too far from your torso. This can lead to an overly upright position, reducing stability and control, particularly on technical or steep descents. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more compact position, improving responsiveness and control on challenging terrain.

                    CHECK STEM LENGTH  
                    A stem that is too long can cause overextension. Switching to a shorter stem can help reduce the shoulder-elbow angle and improve your handling and stability on rough trails.

                    REASSESS HANDLEBAR WIDTH  
                    If your handlebars are excessively wide, they may force your arms into an extended position. Consider handlebars that better match your shoulder width and riding style for better control.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of your handlebars or add spacers under the stem to fine-tune the shoulder-elbow angle for technical terrain and steep descents.

                    Always make small, incremental changes to achieve a balanced and controlled position suitable for mountain biking’s varied demands.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-elbow angle is within the recommended range, ensuring a stable, controlled, and responsive riding position for mountain biking.

                    Factors such as handlebar position, stem length, handlebar width, and overall posture all contribute to maintaining this ideal range. Regularly check these elements, as mountain biking involves diverse terrains and styles where proper alignment is key to performance, stability, and injury prevention.
                    """
            ),
            "Kids bike": AngleDetails(
                minAngle: 70,
                maxAngle: 105,
                description: """
                    On a kids' bike, the shoulder-elbow angle, which measures the angle between the torso, shoulder, and elbow, is critical for maintaining a comfortable, stable, and safe riding position. This angle should range between 70 and 105 degrees, offering flexibility for different riding positions while supporting proper control and steering. A smaller angle can indicate a cramped position, limiting movement and creating tension, while a larger angle may lead to an overly upright posture, reducing control and stability.
                    """,
                belowMinRecommendation: """
                    Your shoulder-elbow angle is too small, indicating that elbows are too close to their torso. This can result in a cramped position, restricted movement, and reduced control. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to create more reach, encouraging a more open and relaxed position.

                    CHECK STEM LENGTH  
                    A short stem may force the child into a compact posture. Consider switching to a slightly longer stem to allow for more reach and better alignment.

                    REASSESS HANDLEBAR WIDTH  
                    Ensure the handlebars are appropriately sized for the child’s shoulder width. Narrow handlebars can force elbows into a cramped position, while properly sized bars promote better arm positioning.

                    CHECK BIKE SIZE  
                    If adjustments don’t resolve the issue, the bike may be too small for the child. Consider upgrading to a larger frame to ensure proper fit and comfort.

                    Always make small, incremental changes to ensure a safe and comfortable riding position for your child.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-elbow angle is too large, indicating that elbows are too far from their torso. This can lead to an overly upright position, reducing control and steering efficiency. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more compact position, improving control and stability.

                    CHECK STEM LENGTH  
                    A stem that is too long can cause overextension. Switching to a shorter stem can help reduce the shoulder-elbow angle and improve handling.

                    REASSESS HANDLEBAR WIDTH  
                    If the handlebars are too wide, they may force the child into an extended position. Ensure the handlebars are appropriately sized for the child’s shoulder width to promote proper arm positioning.

                    CHECK BIKE SIZE  
                    If the bike is too large for the child, it can force them into an overly upright position. Ensure the bike is the correct size to support a safe and comfortable riding posture.

                    Always test changes incrementally to ensure a stable and controlled riding position for your child.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-elbow angle is within the recommended range, ensuring a comfortable, stable, and controlled riding position.

                    Factors such as handlebar position, stem length, handlebar width, and bike size all contribute to maintaining this ideal range. Regularly check these elements, as children grow quickly and may outgrow their bikes, requiring adjustments or a larger size to maintain proper fit and safety.
                    """
            ),
            "Other": AngleDetails(
                minAngle: 70,
                maxAngle: 115,
                description: """
                    For all bike types, the shoulder-elbow angle, which measures the angle between the torso, shoulder, and elbow, is a critical factor for maintaining comfort, control, and efficiency. This angle should typically range between 70 and 115 degrees, allowing flexibility for different riding styles and positions. A smaller angle can indicate a cramped position, causing tension and reduced mobility, while a larger angle may result in an overly upright posture, compromising control, efficiency, and aerodynamics.
                    """,
                belowMinRecommendation: """
                    Your shoulder-elbow angle is too small, indicating that your elbows are too close to your torso. This can result in a cramped position, restricted movement, and reduced comfort. To address this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly forward or lower to create more reach, promoting a more open and relaxed riding posture.

                    CHECK STEM LENGTH  
                    A stem that is too short can force you into a compact position. Switching to a slightly longer stem can help extend the reach and open up the shoulder-elbow angle.

                    REASSESS HANDLEBAR WIDTH  
                    Ensure the handlebars are appropriate for your shoulder width. Narrow handlebars can lead to excessive compactness, while correctly sized handlebars promote better arm positioning.

                    OTHER ADJUSTMENTS  
                    Adjust handlebar tilt or spacer height under the stem to further refine your position and improve arm extension for better comfort and control.

                    Always test changes incrementally to achieve a balanced and comfortable riding position.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-elbow angle is too large, indicating that your elbows are too far from your torso. This can lead to an overly upright posture, reducing control, efficiency, and responsiveness. To correct this, consider the following adjustments:
                    
                    ADJUST HANDLEBAR POSITION  
                    Move the handlebars slightly backward or raise them to encourage a more compact position, improving stability and control.

                    CHECK STEM LENGTH  
                    A stem that is too long can cause overextension. Switching to a shorter stem can help reduce the shoulder-elbow angle and improve handling and comfort.

                    REASSESS HANDLEBAR WIDTH  
                    If the handlebars are excessively wide, they may force you into an extended position. Ensure the handlebars are appropriate for your shoulder width to support proper arm positioning.

                    OTHER ADJUSTMENTS  
                    Adjust the tilt of your handlebars or add spacers under the stem to fine-tune the shoulder-elbow angle while maintaining comfort and control.

                    Always make small, incremental adjustments to ensure a stable, comfortable, and efficient riding posture across various bike types and conditions.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-elbow angle is within the recommended range, ensuring a balanced, comfortable, and controlled riding position suitable for a variety of bikes.

                    Factors such as handlebar position, stem length, handlebar width, and overall posture all contribute to maintaining this ideal range. Regularly check these elements, as different bike types and riding styles may require adjustments to optimize comfort, control, and performance.
                    """
            )
        ]
    ),
    
    // Shoulder-Neck ALL OPTIONS----------------------------
    AngleRange(
        jointName: "Shoulder-Neck",
        bikeSpecificDetails: [
            "Road bike": AngleDetails(
                minAngle: 150,
                maxAngle: 180,
                description: """
                    On a road bike, the shoulder-neck angle, which measures the angle between your torso, shoulder, and neck, is crucial for balancing comfort and aerodynamics. This angle should ideally range between 150 and 180 degrees, reflecting a neutral head and neck position. A smaller angle, where the head tilts too far forward, can cause tension and fatigue in the neck and shoulders, while a larger angle, where the head tilts too far backward, may reduce visibility and comfort. Factors such as rider posture, helmet style, and individual flexibility play significant roles in achieving the correct angle.
                    """,
                belowMinRecommendation: """
                    Your shoulder-neck angle is too small, indicating that your head is tilted too far forward, which can lead to neck and upper back strain, particularly over long distances. To improve this, consider the following adjustments:
                    
                    IMPROVE RIDER POSTURE  
                    Focus on maintaining a neutral spine and relaxed shoulders while riding. Avoid hunching forward excessively, as this increases the forward tilt of your neck.

                    ADJUST HELMET POSITION  
                    Ensure your helmet is positioned correctly on your head. A poorly fitted helmet that sits too low or far forward can force you to tilt your head further forward.

                    OPTIMIZE HANDLEBAR REACH  
                    While not the primary factor, excessive reach to the handlebars can contribute to forward head tilt. If necessary, adjust the reach slightly by changing the stem or handlebar position.

                    CONSIDER FLEXIBILITY TRAINING  
                    Limited flexibility in the neck and upper back can contribute to forward neck tilt. Stretching and strengthening exercises can help improve range of motion and posture over time.

                    Always monitor how changes impact your comfort during rides, and make adjustments incrementally to avoid overcompensating.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-neck angle is too large, indicating that your head is tilted too far backward. This can lead to discomfort and reduced control, especially when riding in an aggressive aerodynamic position. To address this, consider the following adjustments:
                    
                    ADJUST HELMET STYLE OR FIT  
                    A helmet with an aggressive aero design or improper fit may force you to tilt your head too far backward to maintain visibility. Consider helmets with designs better suited to your riding posture.

                    IMPROVE RIDER POSTURE  
                    Check for excessive upright posture, as this can contribute to backward head tilt. Focus on a slight forward lean with a neutral spine and relaxed shoulders to balance your position.

                    OPTIMIZE BODY ALIGNMENT  
                    Ensure that your overall posture, including shoulder and arm positioning, supports a neutral neck angle. Avoid overextending your torso or sitting too upright.

                    CONSIDER BIKE FIT REVIEW  
                    If discomfort persists, a professional bike fit may help identify subtle adjustments in your setup that could improve neck alignment without compromising other aspects of your position.

                    Always test any changes gradually and ensure they enhance both comfort and performance.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-neck angle is within the recommended range, ensuring a comfortable, balanced, and efficient riding position.

                    Key factors such as rider posture, helmet style, and body alignment contribute significantly to maintaining this ideal range. Regularly review these elements, as small changes in your setup or riding style can impact your comfort and performance during long rides.
                    """
            ),
            "Time-trial bike": AngleDetails(
                minAngle: 140,
                maxAngle: 185,
                description: """
                    On a time-trial bike, the shoulder-neck angle, which measures the angle between your torso, shoulder, and neck, is critical for achieving aerodynamic efficiency while maintaining comfort and visibility. This angle typically ranges between 140 and 185 degrees, reflecting the forward-leaning posture inherent to time-trial riding. A slightly tilted head position is common and necessary to maintain an aerodynamic posture. However, excessive forward tilt can cause neck and upper back strain, while excessive backward tilt can reduce visibility and comfort.
                    """,
                belowMinRecommendation: """
                    Your shoulder-neck angle is too small, indicating that your head is tilted too far forward. This can lead to significant strain in the neck and shoulders, especially over long time trials. To improve this, consider the following adjustments:
                    
                    ADJUST RIDER POSTURE  
                    Focus on a relaxed upper body with minimal tension in the shoulders. Avoid excessive forward hunching, as this can increase strain on your neck.

                    CHECK AERO BAR EXTENSIONS  
                    If your aero bars are positioned too far forward or downward, they may force your body into a position that increases neck tilt. Adjust the aero bar reach or tilt to reduce excessive forward lean.

                    OPTIMIZE HELMET POSITION  
                    Ensure your helmet fits correctly and aligns with your body position. A poorly positioned aero helmet can exacerbate neck strain by requiring additional forward tilt to maintain visibility.

                    CONSIDER FLEXIBILITY AND MOBILITY TRAINING  
                    Improving flexibility and mobility in your neck and upper back can help you achieve a more sustainable forward-leaning position.

                    Always make adjustments incrementally and test their effects during practice rides to ensure comfort and efficiency.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-neck angle is too large, indicating that your head is tilted too far backward. This can compromise your aerodynamic posture and increase discomfort during time trials. To correct this, consider the following adjustments:
                    
                    ADJUST HELMET STYLE OR FIT  
                    A helmet with an aggressive aero design or an improper fit may force you to tilt your head backward for visibility. Consider helmets specifically designed for time-trial positions that align with your body posture.

                    ADJUST RIDER POSTURE  
                    Check for an overly upright torso position. Ensure you are maintaining a forward-leaning posture with a neutral spine to balance aerodynamics and comfort.

                    REASSESS AERO BAR POSITION  
                    If the aero bars are set too far back or too high, they may encourage an overly upright posture, increasing backward neck tilt. Lower or extend the aero bars slightly to create a more streamlined position.

                    CONSIDER BIKE FIT REVIEW  
                    A professional bike fit can help identify subtle adjustments in your overall setup to optimize shoulder and neck alignment for a time-trial position.

                    Always make small, incremental changes to maintain aerodynamic efficiency without compromising visibility and comfort.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-neck angle is within the recommended range, ensuring an aerodynamic, efficient, and sustainable riding position for time trials.

                    Key factors such as rider posture, aero bar position, and helmet style contribute significantly to maintaining this ideal range. Regularly review these elements, as even small changes in your setup can impact your performance and comfort during prolonged efforts.
                    """
            ),
            "Gravel bike": AngleDetails(
                minAngle: 150,
                maxAngle: 175,
                description: """
                    On a gravel bike, the shoulder-neck angle, which measures the angle between your torso, shoulder, and neck, is crucial for maintaining comfort, control, and visibility over varied terrain. This angle should ideally range between 150 and 175 degrees, allowing for a neutral neck position that balances stability and long-term comfort. A smaller angle, where the head tilts too far forward, can lead to neck and shoulder strain, while a larger angle, where the head tilts too far backward, may reduce control and visibility on uneven surfaces.
                    """,
                belowMinRecommendation: """
                    Your shoulder-neck angle is too small, indicating that your head is tilted too far forward. This can lead to strain in the neck and shoulders, particularly during long rides or over rough terrain. To improve this, consider the following adjustments:
                    
                    MAINTAIN RELAXED POSTURE  
                    Focus on keeping your shoulders relaxed and avoid hunching forward excessively, which can increase neck strain.

                    OPTIMIZE HELMET POSITION  
                    Ensure your helmet is properly fitted and positioned. A helmet that sits too far forward can force excessive forward neck tilt.

                    BALANCE BODY ALIGNMENT  
                    Check your overall posture to ensure a balanced weight distribution between the saddle and handlebars. Avoid leaning excessively forward.

                    CONSIDER FLEXIBILITY AND STRENGTH TRAINING  
                    Limited flexibility in the neck and upper back can contribute to discomfort. Regular stretching and strength exercises can help improve posture and reduce neck strain.

                    Always make adjustments gradually and monitor the impact on your comfort during rides.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-neck angle is too large, indicating that your head is tilted too far backward. This can reduce visibility and lead to discomfort or instability on uneven terrain. To address this, consider the following adjustments:
                    
                    MAINTAIN RELAXED POSTURE  
                    Ensure you are not sitting too upright, as this can increase backward neck tilt. Keep a slight forward lean with a neutral spine to balance comfort and control.

                    ADJUST HELMET STYLE OR FIT  
                    A helmet with a poor fit or aggressive aero design may require additional backward tilt for visibility. Consider helmets designed for gravel or endurance riding, which better suit a neutral posture.

                    CHECK BODY ALIGNMENT  
                    Ensure your weight is balanced between the handlebars and saddle, avoiding excessive backward tilt caused by overly upright positioning.

                    CONSULT A BIKE FITTER  
                    If issues persist, a professional bike fit can help refine your posture and alignment to prevent discomfort and maximize performance.

                    Always make incremental adjustments to achieve a stable and comfortable riding position suited for gravel terrain.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-neck angle is within the recommended range, ensuring a comfortable, balanced, and stable riding posture for gravel adventures.

                    Factors such as rider posture, helmet fit, and body alignment all contribute significantly to maintaining this ideal range. Regularly review these elements, as gravel riding often involves varied terrain and long distances where proper alignment is key to preventing fatigue and maintaining control.
                    """
            ),
            "Mountain bike": AngleDetails(
                minAngle: 145,
                maxAngle: 175,
                description: """
                    On a mountain bike, the shoulder-neck angle, which measures the angle between your torso, shoulder, and neck, is critical for maintaining control, stability, and comfort over technical and varied terrain. This angle should ideally range between 145 and 175 degrees, allowing for a slightly neutral to moderately tilted head position to balance visibility, shock absorption, and responsiveness. A smaller angle, where the head tilts too far forward, can lead to neck and upper back strain, while a larger angle, where the head tilts too far backward, may reduce visibility and control during steep descents or technical features.
                    """,
                belowMinRecommendation: """
                    Your shoulder-neck angle is too small, indicating that your head is tilted too far forward. This can cause strain in the neck and shoulders, particularly during technical climbs or long rides. To address this, consider the following adjustments:
                    
                    MAINTAIN RELAXED POSTURE  
                    Focus on keeping your shoulders relaxed and avoid hunching forward excessively, as this increases neck strain, particularly on climbs.

                    CHECK HELMET POSITION AND FIT  
                    Ensure your helmet is properly positioned. A poorly adjusted helmet that sits too far forward can force excessive neck tilt.

                    BALANCE YOUR RIDING POSTURE  
                    Ensure your torso is not excessively leaned forward for extended periods, particularly during non-technical sections. Adjust your body weight distribution to maintain a neutral neck angle.

                    IMPROVE FLEXIBILITY AND MOBILITY  
                    Limited flexibility in the neck and upper back can exacerbate forward tilt. Regular stretching and mobility exercises can help you maintain a more relaxed posture.

                    Always test these changes incrementally to maintain control and comfort on varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-neck angle is too large, indicating that your head is tilted too far backward. This can lead to discomfort, reduced visibility, and compromised control during technical descents or rough trails. To correct this, consider the following adjustments:
                    
                    MAINTAIN A FORWARD-LEANING POSTURE  
                    Check for an overly upright torso position, which can force your neck into excessive backward tilt. Ensure a slight forward lean to balance stability and comfort.

                    CHECK HELMET STYLE AND POSITION  
                    An ill-fitting or inappropriate helmet, such as one designed for aggressive downhill riding, may require you to tilt your head backward. Opt for a helmet suited for your riding style that aligns with your posture.

                    ADJUST BODY ALIGNMENT  
                    Avoid shifting too much weight backward during non-technical or flat sections. Maintain even weight distribution between the handlebars and saddle to reduce backward neck tilt.

                    CONSULT A BIKE FITTER  
                    If issues persist, consider a professional bike fit to refine your riding posture and ensure it suits the demands of mountain biking.

                    Always make small, incremental changes to maintain comfort and visibility while navigating varied terrain.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-neck angle is within the recommended range, ensuring a stable, comfortable, and controlled riding position for mountain biking.

                    Factors such as rider posture, helmet fit, and body alignment all contribute significantly to maintaining this ideal range. Regularly review these elements, as mountain biking often involves diverse terrains and riding styles where proper alignment is key to performance, control, and injury prevention.
                    """
            ),
            "Kids bike": AngleDetails(
                minAngle: 150,
                maxAngle: 180,
                description: """
                    On a kids' bike, the shoulder-neck angle, which measures the angle between the torso, shoulder, and neck, is critical for ensuring a comfortable and safe riding position. This angle should range between 150 and 180 degrees, allowing for a neutral head and neck position that balances visibility and reduces strain. A smaller angle, where the head tilts too far forward, can cause discomfort and fatigue, while a larger angle, where the head tilts too far backward, may reduce control and lead to instability. Proper saddle-to-handlebar distance and posture adjustments are essential for growing riders.
                    """,
                belowMinRecommendation: """
                    Your shoulder-neck angle is too small, indicating that head is tilted too far forward. This can cause discomfort and strain in the neck and shoulders, especially during longer rides. To address this, consider the following adjustments:
                    
                    MAINTAIN RELAXED POSTURE  
                    Encourage you keep their shoulders relaxed and avoid hunching forward excessively, as this increases neck strain.

                    CHECK HELMET POSITION AND FIT  
                    Ensure the helmet is properly fitted and not sitting too far forward on the child’s head, as this can force them to tilt their neck forward unnaturally.

                    CHECK SADDLE-TO-HANDLEBAR DISTANCE  
                    If the distance between the saddle and handlebars is too great, your child may have to reach excessively, increasing neck strain. Shorten the stem or move the saddle slightly forward to reduce the reach.

                    CHOOSE APPROPRIATE BIKE SIZE  
                    If the bike is too large, it may force your child into a stretched position, increasing forward tilt. Ensure the bike size matches their current height and proportions.

                    Always make adjustments incrementally and ensure your child feels comfortable and in control while riding.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-neck angle is too large, indicating that  head is tilted too far backward. This can cause discomfort, reduce visibility, and compromise control. To correct this, consider the following adjustments:
                    
                    MAINTAIN A SLIGHT FORWARD POSTURE  
                    Encourage you lean head slightly forward, keeping their spine neutral, to avoid excessive backward neck tilt.

                    CHECK HELMET POSITION AND STYLE  
                    Ensure the helmet fits correctly and is not overly bulky or poorly balanced, as this can force the child to tilt their head backward for visibility.

                    CHECK SADDLE-TO-HANDLEBAR DISTANCE  
                    If the distance between the saddle and handlebars is too short, it may push your child into an overly upright position. Lengthen the stem or move the saddle slightly backward to allow for more natural reach.

                    CHOOSE APPROPRIATE BIKE SIZE  
                    If the bike is too small, it may cause an overly upright posture. Upgrade to a bike that fits your child’s current size to ensure proper alignment.

                    Always test adjustments gradually to ensure a comfortable and safe riding position for your child.
                    """,
                withinRangeRecommendation: """
                    Your child’s shoulder-neck angle is within the recommended range, ensuring a comfortable, safe, and balanced riding posture.

                    Factors such as helmet fit, saddle-to-handlebar distance, and bike size all contribute significantly to maintaining this ideal range. Regularly review these elements, as children grow quickly and may outgrow their bikes, requiring adjustments or upgrades to support their comfort and control.
                    """
            ),
            "Other": AngleDetails(
                minAngle: 150,
                maxAngle: 180,
                description: """
                    For all bike types, the shoulder-neck angle, which measures the angle between the torso, shoulder, and neck, is essential for maintaining comfort, visibility, and control. This angle should range between 150 and 180 degrees, allowing for a neutral head position that reduces strain and supports various riding styles. A smaller angle, where the head tilts too far forward, can cause neck and shoulder discomfort, while a larger angle, where the head tilts too far backward, may lead to reduced visibility and compromised control. Factors such as posture, helmet fit, and saddle-to-handlebar distance significantly influence this angle.
                    """,
                belowMinRecommendation: """
                    Your shoulder-neck angle is too small, indicating that your head is tilted too far forward. This can lead to neck and upper back strain, especially during extended rides. To address this, consider the following adjustments:
                    
                    MAINTAIN RELAXED POSTURE  
                    Keep your shoulders relaxed and avoid excessive forward hunching, which increases neck strain and discomfort.

                    CHECK HELMET POSITION AND FIT  
                    Ensure your helmet is properly fitted and positioned. A helmet that sits too far forward can force you to tilt your neck forward unnaturally.

                    CHECK SADDLE-TO-HANDLEBAR DISTANCE  
                    If the distance between the saddle and handlebars is too great, it can push your torso too far forward. Consider shortening the stem or moving the saddle slightly forward to reduce reach and improve posture.

                    ADJUST RIDING STYLE  
                    Evaluate whether your riding posture matches the intended style for your bike. Adopting a more upright position, if appropriate, can help reduce forward neck tilt.

                    Always make adjustments incrementally to ensure comfort and maintain control across various riding conditions.
                    """,
                aboveMaxRecommendation: """
                    Your shoulder-neck angle is too large, indicating that your head is tilted too far backward. This can reduce visibility and lead to discomfort, particularly during extended rides or technical terrain. To correct this, consider the following adjustments:
                    
                    MAINTAIN A SLIGHT FORWARD LEAN  
                    Ensure you maintain a slight forward lean in your posture to balance stability and comfort, avoiding excessive backward tilt.

                    CHECK HELMET STYLE AND FIT  
                    An ill-fitting or overly aggressive helmet design may force you to tilt your head backward for visibility. Opt for a helmet that aligns better with your riding posture.

                    CHECK SADDLE-TO-HANDLEBAR DISTANCE  
                    If the distance between the saddle and handlebars is too short, it can push you into an overly upright posture. Lengthen the stem or move the saddle slightly backward to improve reach and neck alignment.

                    ADJUST RIDING STYLE  
                    Ensure your riding position supports the intended bike type and terrain. Avoid sitting too upright if it compromises control or visibility.

                    Always make small, incremental changes to maintain a balanced, comfortable, and controlled riding posture.
                    """,
                withinRangeRecommendation: """
                    Your shoulder-neck angle is within the recommended range, ensuring a comfortable, balanced, and efficient riding posture for your bike type.

                    Factors such as helmet fit, saddle-to-handlebar distance, and posture all contribute significantly to maintaining this ideal range. Regularly review these elements, as different bike types and riding styles may require minor adjustments to optimize comfort and performance.
                    """
            )
        ]
    ),
    
    //HIP ALL OPTIONS--------------------------------------
    AngleRange(
        jointName: "Hip",
        bikeSpecificDetails: [
            "Road bike": AngleDetails(
                minAngle: 50,
                maxAngle: 90,
                description: """
                    On a road bike, the hip angle, which measures the angle between the leg and torso (knee-hip-shoulder), is a important factor in ensuring efficient pedaling mechanics, comfort, and performance. This angle should range between 50 and 90 degrees. A smaller angle (closer to 50°) can indicate that the leg is coming too close to the chest, which may restrict breathing and reduce power output. A larger angle (closer to 90°) may result in overextension of the leg, causing strain on the hips and lower back. Proper adjustments help achieve a balanced position for sustained riding efficiency.
                    """,
                belowMinRecommendation: """
                    Your hip angle is too small, indicating that your leg is coming too close to your chest during the pedal stroke. This can cause discomfort, restrict breathing, and reduce power efficiency. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Slightly increase the saddle height to extend the leg further during the pedal stroke, reducing compression at the top of the motion.

                    MOVE THE SADDLE BACKWARD  
                    Adjust the saddle position backward to create more distance between your torso and knee, promoting a more open hip angle.

                    MAINTAIN A RELAXED POSTURE  
                    Ensure you’re not hunching excessively over the handlebars, as this can decrease the hip angle. Focus on keeping your upper body relaxed with a neutral spine.

                    CHECK BIKE FIT  
                    If saddle adjustments don’t resolve the issue, consider a professional bike fit to refine your overall setup for proper hip alignment.

                    Always test changes incrementally to maintain comfort and ensure efficient pedaling mechanics.
                    """,
                aboveMaxRecommendation: """
                    Your hip angle is too large, indicating that your leg is extending too far behind your torso during the pedal stroke. This can strain the hips and lower back, reducing pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Slightly decrease the saddle height to reduce leg extension at the bottom of the pedal stroke, bringing the hip angle within the recommended range.

                    MOVE THE SADDLE FORWARD  
                    Adjust the saddle position slightly forward to shorten the distance between your hip and knee during the pedal motion.

                    MAINTAIN A FORWARD-LEANING POSTURE  
                    Ensure you’re maintaining a slight forward lean with a relaxed upper body. An overly upright posture can exacerbate hip overextension.

                    CHECK BIKE FIT  
                    If adjustments to the saddle don’t resolve the issue, consult a professional bike fitter to optimize your setup for road cycling.

                    Always make small, incremental changes to preserve comfort and maintain efficient pedaling mechanics.
                    """,
                withinRangeRecommendation: """
                    Your hip angle is within the recommended range, ensuring an efficient, comfortable, and balanced pedaling motion for road cycling.

                    Factors such as saddle height, saddle position, and rider posture contribute significantly to maintaining this ideal range. Regularly review these elements, as small adjustments can enhance both comfort and performance during long rides or intense efforts.
                    """
            )
,
            "Time-trial bike": AngleDetails(
                minAngle: 45,
                maxAngle: 85,
                description: """
                    On a time-trial bike, the hip angle, which measures the angle between the leg and torso (knee-hip-shoulder), is important for maintaining an aerodynamic position while ensuring efficient pedaling mechanics. This angle should range between 45 and 85 degrees. A smaller angle (closer to 45°) supports a highly aerodynamic posture but requires excellent flexibility, while a larger angle (closer to 85°) may accommodate comfort and breathing efficiency. Proper hip angle adjustments ensure power transfer and sustainability during time trials or triathlons.
                    """,
                belowMinRecommendation: """
                    Your hip angle is too small, indicating that your leg is coming too close to your chest during the pedal stroke. This can restrict breathing, reduce power output, and cause discomfort. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Increase the saddle height slightly to extend the leg further and prevent excessive hip compression at the top of the pedal stroke.

                    MOVE THE SADDLE FORWARD  
                    Adjust the saddle position forward to support a more open hip angle while maintaining alignment with the aero bars.

                    ADJUST AERO BAR POSITION  
                    If the aero bars are positioned too far forward or low, they can force excessive torso flexion, reducing the hip angle. Raise or shorten the aero bars slightly to improve alignment.

                    FOCUS ON FLEXIBILITY AND MOBILITY  
                    Tight hip flexors or lower back stiffness can exacerbate discomfort in aggressive positions. Incorporate stretching and mobility exercises to support greater hip range of motion.

                    Always make small, incremental adjustments to ensure comfort and efficiency while preserving aerodynamics.
                    """,
                aboveMaxRecommendation: """
                    Your hip angle is too large, indicating that your leg is extending too far behind your torso during the pedal stroke. This can strain the hips, lower back, and reduce pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Decrease the saddle height slightly to limit the leg extension and bring the hip angle back into the recommended range.

                    MOVE THE SADDLE BACKWARD  
                    Adjust the saddle position backward to allow for more natural alignment between the hips and knees, promoting a compact and efficient pedaling motion.

                    CHECK RIDER POSTURE  
                    Ensure you are maintaining a forward-leaning aero posture. Sitting too upright can reduce leg alignment and lead to overextension.

                    CONSULT A BIKE FITTER  
                    If adjustments don’t resolve the issue, a professional bike fit can help optimize your setup for time-trial positioning and pedaling efficiency.

                    Always make small, incremental changes and monitor their impact on your power output and comfort.
                    """,
                withinRangeRecommendation: """
                    Your hip angle is within the recommended range, ensuring an efficient, comfortable, and aerodynamic pedaling motion for time-trial performance.

                    Factors such as saddle height, saddle position, and aero bar alignment contribute significantly to maintaining this ideal range. Regularly review these elements, as small adjustments can enhance both comfort and performance during sustained efforts.
                    """
            ),
            "Gravel bike": AngleDetails(
                minAngle: 50,
                maxAngle: 110,
                description: """
                    On a gravel bike, the hip angle, which measures the angle between the leg and torso (knee-hip-shoulder), is essential for maintaining efficient pedaling mechanics and comfort over varied terrain. This angle should range between 50 and 110 degrees. A smaller angle (closer to 50°) may indicate that the leg is coming too close to the chest, restricting breathing and increasing discomfort on rough terrain. A larger angle (closer to 110°) could lead to overextension, causing strain on the hips or lower back. Proper adjustments ensure efficient power transfer and comfort for long rides on mixed surfaces.
                    """,
                belowMinRecommendation: """
                    Your hip angle is too small, indicating that your leg is coming too close to your chest during the pedal stroke. This can cause discomfort, restrict breathing, and reduce pedaling efficiency, especially on rough terrain. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Increase the saddle height slightly to extend the leg further and reduce compression at the top of the pedal stroke.

                    MOVE THE SADDLE BACKWARD  
                    Adjust the saddle position backward to create more distance between your torso and knee, opening up the hip angle and improving comfort on uneven surfaces.

                    ADJUST RIDING POSTURE  
                    Focus on maintaining a relaxed posture with a neutral spine. Avoid hunching excessively forward, as this decreases the hip angle and limits breathing efficiency.

                    CHECK BIKE FIT  
                    If these adjustments don’t resolve the issue, consult a professional bike fitter to optimize your setup for gravel riding.

                    Always make incremental changes and test their effects on both comfort and control across varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your hip angle is too large, indicating that your leg is extending too far behind your torso during the pedal stroke. This can strain the hips, lower back, and reduce pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Slightly decrease the saddle height to limit leg extension at the bottom of the pedal stroke and bring the hip angle back into the recommended range.

                    MOVE THE SADDLE FORWARD  
                    Adjust the saddle position slightly forward to shorten the distance between your hip and knee during the pedal motion, reducing strain.

                    MAINTAIN BALANCED POSTURE  
                    Ensure you are leaning slightly forward, keeping your weight evenly distributed between the saddle and handlebars. Avoid an overly upright position, which can exacerbate overextension.

                    CHECK BIKE FIT  
                    If simple adjustments don’t resolve the issue, a professional bike fit can help refine your setup for gravel riding, accounting for the demands of varied terrain.

                    Always test adjustments incrementally to maintain efficiency, comfort, and control over long rides.
                    """,
                withinRangeRecommendation: """
                    Your hip angle is within the recommended range, ensuring a comfortable, efficient, and balanced pedaling motion for gravel riding.

                    Factors such as saddle height, saddle position, and riding posture contribute significantly to maintaining this ideal range. Regularly review these elements, as small adjustments can optimize performance and comfort for long rides over mixed terrain.
                    """
            ),
            "Mountain bike": AngleDetails(
                minAngle: 55,
                maxAngle: 120,
                description: """
                    On a mountain bike, the hip angle, which measures the angle between the leg and torso (knee-hip-shoulder), is essential for maintaining comfort, stability, and efficient pedaling mechanics across varied terrain. This angle should range between 55 and 120 degrees. A slightly more upright posture, common in mountain biking, accommodates better visibility and control on technical sections. A smaller angle (closer to 55°) may indicate that the leg is coming too close to the chest, restricting movement and breathing. A larger angle (closer to 120°) may result in overextension, causing strain on the hips and lower back. Proper adjustments ensure a comfortable and controlled riding position for technical climbs, descents, and flat sections.
                    """,
                belowMinRecommendation: """
                    Your hip angle is too small, indicating that your leg is coming too close to your chest during the pedal stroke. This can cause discomfort, restrict breathing, and reduce stability, especially on climbs or rough terrain. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Increase the saddle height slightly to extend the leg further and reduce compression at the top of the pedal stroke.

                    MOVE THE SADDLE  
                    Adjust the saddle position backward to create more space between your torso and knee, opening up the hip angle and improving comfort for technical riding.

                    MAINTAIN UPRIGHT POSTURE  
                    Mountain biking requires a naturally upright posture for control and visibility. Ensure you’re not hunching excessively forward, as this can decrease the hip angle and limit breathing efficiency.

                    CHECK BIKE FIT  
                    If these adjustments don’t resolve the issue, consult a professional bike fitter to ensure your setup supports a comfortable position for mountain biking.

                    Always test changes incrementally to ensure they improve both comfort and control over varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your hip angle is too large, indicating that your leg is extending too far behind your torso during the pedal stroke. This can strain the hips and lower back and reduce pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Slightly decrease the saddle height to limit leg extension at the bottom of the pedal stroke, bringing the hip angle back into the recommended range.

                    MOVE THE SADDLE  
                    Adjust the saddle position slightly forward to shorten the distance between your hip and knee, reducing strain and maintaining better alignment.

                    MAINTAIN BALANCED POSTURE  
                    Ensure you are sitting upright but not overly so, with your weight evenly distributed between the saddle and handlebars. Overextension can occur if the torso is too far back or upright.

                    CHECK BIKE FIT  
                    If simple adjustments don’t resolve the issue, a professional bike fit can help refine your setup for mountain biking, ensuring comfort and control on technical terrain.

                    Always test adjustments incrementally to maintain stability and efficiency while navigating varied terrain.
                    """,
                withinRangeRecommendation: """
                    Your hip angle is within the recommended range, ensuring a comfortable, stable, and efficient pedaling motion for mountain biking.

                    Factors such as saddle height, saddle position, and upright posture contribute significantly to maintaining this ideal range. Regularly review these elements, as small adjustments can optimize comfort and control for technical climbs, descents, and varied trails.
                    """
            ),
            "Kids bike": AngleDetails(
                minAngle: 60,
                maxAngle: 120,
                description: """
                    On a kids' bike, the hip angle, which measures the angle between the leg and torso (knee-hip-shoulder), is essential for maintaining comfort, stability, and efficient pedaling. This angle should range between 60 and 120 degrees, reflecting a naturally more upright posture common for young riders. A smaller angle (closer to 60°) may indicate that the leg is coming too close to the chest, causing discomfort or restricting movement. A larger angle (closer to 120°) may result in overextension, leading to strain on the hips or difficulty pedaling efficiently. Proper adjustments ensure that children remain comfortable and maintain control while riding.
                    """,
                belowMinRecommendation: """
                    Your hip angle is too small, indicating that leg is coming too close to their chest during the pedal stroke. This can cause discomfort, restrict movement, and reduce pedaling efficiency. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Increase the saddle height slightly to extend the leg further and reduce compression at the top of the pedal stroke.

                    MOVE THE SADDLE BACKWARD  
                    Adjust the saddle position backward to create more space between the torso and knee, opening up the hip angle and improving comfort.

                    ENSURE THE BIKE IS THE RIGHT SIZE  
                    If the bike is too small, it may force the child into a cramped position. Ensure the bike is appropriately sized for their height and leg length.

                    ENCOURAGE RELAXED POSTURE  
                    Teach your child to maintain a relaxed, upright posture while riding. Avoiding excessive hunching can improve their breathing and overall comfort.

                    Always make adjustments incrementally and ensure your child feels comfortable and secure after each change.
                    """,
                aboveMaxRecommendation: """
                    Your hip angle is too large, indicating that leg is extending too far behind their torso during the pedal stroke. This can strain the hips, lower back, and reduce pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Slightly decrease the saddle height to limit leg extension at the bottom of the pedal stroke, bringing the hip angle back into the recommended range.

                    MOVE THE SADDLE FORWARD  
                    Adjust the saddle position slightly forward to shorten the distance between the hip and knee, ensuring better alignment and reducing strain.

                    CHECK THE BIKE FIT  
                    If the bike is too large, it may push the child into an overly upright position, exacerbating leg overextension. Ensure the bike size matches their current growth stage.

                    ENCOURAGE A SLIGHT FORWARD LEAN  
                    Teach your child to lean slightly forward while riding, which can help maintain a balanced pedaling motion and prevent overextension.

                    Always test adjustments incrementally and confirm your child feels comfortable and confident after the changes.
                    """,
                withinRangeRecommendation: """
                    Your child’s hip angle is within the recommended range, ensuring a comfortable, stable, and efficient pedaling motion.

                    Factors such as saddle height, saddle position, bike size, and relaxed posture contribute significantly to maintaining this ideal range. Regularly check these elements, as children grow quickly and may outgrow their bikes, requiring adjustments or upgrades to sustain proper alignment and comfort.
                    """
            ),
            "Other": AngleDetails(
                minAngle: 55,
                maxAngle: 125,
                description: """
                    For all bike types, the hip angle, which measures the angle between the leg and torso (knee-hip-shoulder), is a critical factor in ensuring efficient pedaling mechanics, comfort, and performance. This angle should range between 55 and 125 degrees, accommodating various riding styles and positions. A smaller angle (closer to 55°) may indicate that the leg is coming too close to the chest, potentially restricting breathing and causing discomfort. A larger angle (closer to 125°) may result in overextension, leading to strain on the hips and lower back. Proper adjustments help achieve a balanced position for sustained comfort and efficiency across different cycling disciplines.
                    """,
                belowMinRecommendation: """
                    Your hip angle is too small, indicating that your leg is coming too close to your chest during the pedal stroke. This can cause discomfort, restrict breathing, and reduce pedaling efficiency. To address this, consider the following adjustments:
                    
                    RAISE THE SADDLE  
                    Increase the saddle height slightly to extend the leg further during the pedal stroke, reducing compression at the top of the motion.

                    MOVE THE SADDLE BACKWARD  
                    Adjust the saddle position backward to create more distance between your torso and knee, promoting a more open hip angle.

                    CHECK RIDER POSTURE  
                    Ensure you're not hunching excessively over the handlebars, as this can decrease the hip angle. Maintain a relaxed posture with a neutral spine to improve comfort and breathing.

                    VERIFY BIKE SIZE AND FIT  
                    If adjustments to the saddle and posture don't resolve the issue, consider whether your bike is the correct size for you. A professional bike fit can help optimize your position and ensure proper alignment.

                    Always make small, incremental changes and test their impact on your comfort and efficiency during rides.
                    """,
                aboveMaxRecommendation: """
                    Your hip angle is too large, indicating that your leg is extending too far behind your torso during the pedal stroke. This can strain the hips, lower back, and reduce pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER THE SADDLE  
                    Decrease the saddle height slightly to limit leg extension at the bottom of the pedal stroke, bringing the hip angle back within the recommended range.

                    MOVE THE SADDLE FORWARD  
                    Adjust the saddle position slightly forward to shorten the distance between your hip and knee during the pedal motion.

                    CHECK RIDER POSTURE  
                    Ensure you are not sitting too upright, which can cause overextension. Maintain a slight forward lean with a relaxed upper body to promote better alignment.

                    VERIFY BIKE SIZE AND FIT  
                    If simple adjustments don't resolve the issue, consult a professional bike fitter to optimize your setup for your specific cycling needs.

                    Always make small, incremental changes to maintain comfort and efficient pedaling mechanics.
                    """,
                withinRangeRecommendation: """
                    Your hip angle is within the recommended range, ensuring an efficient, comfortable, and balanced pedaling motion.

                    Factors such as saddle height, saddle position, rider posture, and bike fit contribute significantly to maintaining this ideal range. Regularly review these elements, as small adjustments can enhance comfort and performance across various types of cycling activities.
                    """
            )
        ]
    ),
    
    //BODY LEAN ALL OPTIONS--------------------------------------
    AngleRange(
        jointName: "Body Lean",
        bikeSpecificDetails: [
            "Road bike": AngleDetails(
                minAngle: 20,
                maxAngle: 50,
                description: """
                    On a road bike, the body lean angle, which measures how much the rider's body leans relative to the horizontal axis, is crucial for balancing aerodynamics, comfort, and pedaling efficiency. This angle typically ranges between 20 and 50 degrees (considered while sitting and holding handlebars in standard position). A smaller angle supports a more aggressive, aerodynamic posture for speed, while a larger angle prioritizes comfort during longer rides or less intense efforts. 
                    """,
                belowMinRecommendation: """
                    Your body lean angle is too small, indicating an overly aggressive position. This can cause discomfort in the neck, shoulders, and lower back, and may reduce breathing efficiency. To address this, consider the following adjustments:
                    
                    RAISE HANDLEBARS  
                    Increase the height of the handlebars to reduce the forward lean and alleviate strain.
                    
                    SHORTEN STEM LENGTH  
                    A shorter stem can reduce reach and encourage a more balanced posture.
                    
                    MAINTAIN RELAXED POSTURE  
                    Focus on keeping your shoulders relaxed and your back neutral to improve comfort.
                    
                    Always make small, incremental adjustments and monitor their impact on comfort and performance.
                    """,
                aboveMaxRecommendation: """
                    Your body lean angle is too large, indicating an overly upright position. This can reduce aerodynamics, increase drag, and compromise pedaling efficiency. To correct this, consider the following adjustments:
                    
                    LOWER HANDLEBARS  
                    Decrease the height of the handlebars to promote a more forward-leaning position.
                    
                    EXTEND STEM LENGTH  
                    A longer stem can improve reach and support a better weight distribution for efficient pedaling.
                    
                    MAINTAIN ACTIVE POSTURE  
                    Practice leaning slightly forward with a neutral spine to balance comfort and aerodynamics.
                    
                    Always test adjustments gradually to ensure a comfortable and efficient riding position.
                    """,
                withinRangeRecommendation: """
                    Your body lean angle is within the recommended range, ensuring a balanced, aerodynamic, and comfortable riding posture for road cycling.
                    
                    Regularly check your handlebar height, stem length, and overall posture to maintain optimal comfort and performance across different riding conditions.
                    """
            ),
            "Time-trial bike": AngleDetails(
                minAngle: 10,
                maxAngle: 30,
                description: """
                    On a time-trial bike, the body lean angle, which measures how much the rider's body leans relative to the horizontal axis, is critical for maximizing aerodynamics and speed. This angle typically ranges between 10 and 30 degrees, with a more horizontal position being ideal for reducing drag. Achieving this lean requires excellent flexibility and a proper bike setup to avoid strain while maintaining an aggressive aerodynamic posture.
                    """,
                belowMinRecommendation: """
                    Your body lean angle is too small, indicating an overly aggressive position. This can cause discomfort in the neck, shoulders, and lower back, and reduce control. To address this, consider the following adjustments:

                    RAISE AERO BARS
                    Increase the height of the aero bars to alleviate strain and improve comfort. Higher aero bar position can be also achieved by higher entire handlebars.
                    
                    ADJUST ARM PAD POSITION
                    Move the arm pads slightly upward or backward to reduce excessive forward lean.
                    
                    CONSULT A BIKE FITTER
                    A professional fitting can optimize your position while preserving aerodynamics.

                    Always make adjustments incrementally and test them during practice rides.
                    """,
                aboveMaxRecommendation: """
                    Your body lean angle is too large, indicating an overly upright position. This can compromise aerodynamics and increase drag. To correct this, consider the following adjustments:

                    LOWER AERO BARS
                    Decrease the height of the aero bars to promote a more forward-leaning position. Lower aero bar position can be also achieved by lowering down entire handlebars.
                    
                    EXTEND ARM PAD POSITION
                    Move the arm pads slightly forward to encourage a lower body lean.
                    
                    MAINTAIN AERODYNAMIC POSTURE
                    Practice sustaining a flat back position for improved efficiency.

                    Always make small, incremental changes to maintain comfort while improving aerodynamics.
                    """,
                withinRangeRecommendation: """
                    Your body lean angle is within the recommended range, ensuring optimal aerodynamics and comfort for time-trial performance.

                    Regularly review your aero bar height, arm pad positioning, and overall posture to sustain an efficient and sustainable riding position.
                    """
            ),
            "Gravel bike": AngleDetails(
                minAngle: 25,
                maxAngle: 50,
                description: """
                    On a gravel bike, the body lean angle balances aerodynamics and comfort for long rides on varied terrain. This angle typically ranges between 25 and 50 degrees (considered while sitting and holding handlebars in standard position), with a slightly upright posture helping absorb shocks from rough surfaces while maintaining efficient pedaling.
                    """,
                belowMinRecommendation: """
                    Your body lean angle is too small, indicating an overly aggressive position. This can strain your neck and shoulders, especially on rough terrain. To address this, consider the following adjustments:

                    RAISE HANDLEBARS
                    Slightly increase the handlebar height to promote a more relaxed position.
                    
                    CHECK STEM LENGTH
                    A shorter stem can reduce reach and encourage a more upright posture.
                    
                    MAINTAIN RELAXED POSTURE
                    Avoid excessive forward hunching to improve comfort on uneven terrain.

                    Make small, incremental adjustments to ensure long-term comfort and stability.
                    """,
                aboveMaxRecommendation: """
                    Your body lean angle is too large, indicating an overly upright position. This can reduce pedaling efficiency and compromise aerodynamics. To correct this, consider the following adjustments:

                    LOWER HANDLEBARS
                    Slightly decrease the handlebar height to encourage a more aerodynamic position.
                    
                    EXTEND STEM LENGTH
                    A longer stem can improve reach and support better weight distribution.
                    
                    MAINTAIN ACTIVE POSTURE
                    Lean slightly forward for better pedaling efficiency and control.

                    Always test adjustments gradually to optimize performance for mixed terrain.
                    """,
                withinRangeRecommendation: """
                    Your body lean angle is within the recommended range, ensuring a comfortable, efficient, and balanced riding posture for gravel cycling.

                    Regularly review handlebar height, stem length, and posture to maintain optimal comfort and control on varied terrain.
                    """
            ),
            "Mountain bike": AngleDetails(
                minAngle: 20,
                maxAngle: 45,
                description: """
                    On a mountain bike, the body lean angle balances control, visibility, and comfort across varied terrain. This angle typically ranges between 20 and 45 degrees (considered while sitting and saddle in standard position), accommodating a more upright posture to enhance stability and responsiveness on technical sections. A smaller angle is useful for climbs, while a larger angle may be necessary for descents or rough terrain.
                    """,
                belowMinRecommendation: """
                    Your body lean angle is too small, indicating an overly aggressive position. This can strain your neck and shoulders and reduce control, especially on technical terrain. To address this, consider the following adjustments:

                    RAISE HANDLEBARS
                    Increase the height of the handlebars to encourage a more upright position.
                    
                    CHECK STEM LENGTH
                    A shorter stem can reduce reach and support a more balanced posture.
                    
                    ADJUST SADDLE POSITION
                    Move the saddle slightly backward to create a more upright posture.

                    Always make incremental adjustments to improve control and comfort on varied terrain.
                    """,
                aboveMaxRecommendation: """
                    Your body lean angle is too large, indicating an overly upright position. This can reduce pedaling efficiency and compromise stability during technical sections. To correct this, consider the following adjustments:

                    LOWER HANDLEBARS
                    Decrease the height of the handlebars to encourage a forward-leaning position.
                    
                    EXTEND STEM LENGTH
                    A longer stem can improve reach and support better weight distribution.
                    
                    MAINTAIN ACTIVE POSTURE
                    Focus on leaning slightly forward while keeping your body relaxed for better control.

                    Make small adjustments to balance comfort and responsiveness for your riding style.
                    """,
                withinRangeRecommendation: """
                    Your body lean angle is within the recommended range, ensuring optimal control, stability, and comfort for mountain biking.

                    Regularly check handlebar height, stem length, and overall posture to maintain a balanced position for technical climbs, descents, and varied trails.
                    """
            ),
            "Kids bike": AngleDetails(
                minAngle: 40,
                maxAngle: 50,
                description: """
                    On a kids' bike, the body lean angle should range between 40 and 50 degrees, providing a comfortable and stable riding position that ensures safety and control. This upright posture accommodates the size of the bike and the developing coordination of young riders.
                    """,
                belowMinRecommendation: """
                    Your body lean angle is too small, indicating an overly aggressive position. This can cause discomfort and reduce stability. To address this, consider the following adjustments:

                    RAISE HANDLEBARS
                    Increase the height of the handlebars to promote a more upright position.
                    
                    CHECK BIKE SIZE
                    Ensure the bike is the correct size for your child to support a natural posture.
                    
                    ENCOURAGE RELAXED POSTURE
                    Teach your child to sit comfortably and avoid leaning too far forward.

                    Test these changes incrementally to ensure your child feels comfortable and secure.
                    """,
                aboveMaxRecommendation: """
                    Your body lean angle is too large, indicating an overly upright position. This can reduce pedaling efficiency and make it harder to control the bike. To correct this, consider the following adjustments:

                    LOWER HANDLEBARS
                    Slightly decrease the handlebar height to encourage a slight forward lean.
                    
                    CHECK BIKE SIZE
                    Ensure the bike isn’t too large, as this can force an awkward posture.
                    
                    ENCOURAGE ACTIVE POSTURE
                    Teach your child to lean slightly forward for better control while maintaining comfort.

                    Make incremental changes and confirm your child feels balanced and confident.
                    """,
                withinRangeRecommendation: """
                    Your child’s body lean angle is within the recommended range, ensuring a stable, comfortable, and controlled riding posture.

                    Regularly check the bike size, handlebar height, and posture to ensure the setup remains suitable as your child grows.
                    """
            ),
            "Other": AngleDetails(
                minAngle: 30,
                maxAngle: 60,
                description: """
                    For all bike types not specifically categorized, the body lean angle typically ranges between 30 and 60 degrees (considered while sitting and holding handlebars in standard position). This range balances comfort, control, and efficiency across different riding styles, from commuting to recreational cycling.
                    """,
                belowMinRecommendation: """
                    Your body lean angle is too small, indicating an overly aggressive position. This can cause discomfort and reduce stability. To address this, consider the following adjustments:

                    RAISE HANDLEBARS
                    Increase the handlebar height to encourage a more upright posture.
                    
                    MAINTAIN RELAXED POSTURE
                    Focus on keeping your shoulders relaxed and avoid excessive forward lean.

                    Always make small, incremental changes to maintain comfort and control.
                    """,
                aboveMaxRecommendation: """
                    Your body lean angle is too large, indicating an overly upright position. This can reduce pedaling efficiency and compromise control. To correct this, consider the following adjustments:

                    LOWER HANDLEBARS
                    Slightly decrease the handlebar height to encourage a forward-leaning posture.
                    
                    MAINTAIN ACTIVE POSTURE
                    Lean slightly forward to enhance pedaling efficiency and control.

                    Make incremental changes to achieve a comfortable, balanced riding position.
                    """,
                withinRangeRecommendation: """
                    Your body lean angle is within the recommended range, ensuring a balanced, comfortable, and efficient riding position.

                    Regularly check handlebar height, bike fit, and posture to sustain an ideal riding posture for your specific needs.
                    """
            )
        ]
    )
]

// Function to get the angle range for a specific joint and bike type
func getAngleDetails(for jointName: String, bikeType: String) -> AngleDetails? {
    return angleRanges.first { $0.jointName == jointName }?.bikeSpecificDetails[bikeType]
}
