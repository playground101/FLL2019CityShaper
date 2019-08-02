//
//  MissionModel.swift
//  FLLScoreSheet
//
//  Created by Mekhala Vithala on 4/28/19.
//  Copyright © 2019 Future Programmers. All rights reserved.
//

import Foundation

struct Mission {
    var code: String //m01, m02 etc
    var description: String  //group description for each mission (m01, m02 etc)
    var details: [MissionDetail] //details of tasks in each mission group
}

struct MissionDetail {
    var task: String
    var points: Int
    var switchOn: Bool
    var tag: Int
    var stepper: Bool
    var maxStepperValue: Int
    var currentStepperValue: Int
    
}

extension FLLMissionsViewController {
    
    func loadMissionModels() -> [Mission] {
        //M01
        let m011 = MissionDetail(task: "Has the Vehicle Payload rolled past the First Track Connection?", points: 22, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m012 = MissionDetail(task: "Has the Crew Payload rolled past the First Track Connection?", points: 14, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m013 = MissionDetail(task: "Has the Supply Payload rolled past the First Track Connection?", points: 10, switchOn: false, tag: 2, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m01 = Mission(code: "M01", description: "Space Travel", details: [m011, m012, m013])
        
        //M02
        let m021 = MissionDetail(task: "Are both Solar Panels angled towards the same field?", points: 22, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m022 = MissionDetail(task: "Is your Solar Panel angled towards the other field?", points: 18, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m02 = Mission(code: "M02", description: "Solar Panel Array", details: [m021, m022])
        
        //M03
        let m031 = MissionDetail(task: "Is the 2x4 brick ejected and completely in the Northeast Planet Area?", points: 22, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m032 = MissionDetail(task: "Is the 2x4 brick ejected and not completely in the Northeast Planet Area?", points: 18, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m03 = Mission(code: "M03", description: "3D Printing", details: [m031,m032])
        
        //M04
        let m041 = MissionDetail(task: "Has the weight-bearing features of the crossing equipment crossed the crater from east to west, making it completely past the flattened gate?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m04 = Mission(code: "M04", description: "Crater Crossing", details: [m041])
        
        //M05
        let m051 = MissionDetail(task: "Are all four samples no longer touching the axle holding them in in the Core Site Model?", points: 16, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m052 = MissionDetail(task: "Is the Gas Core Sample touching the mat completely in the Lander Target Circle?", points: 12, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m053 = MissionDetail(task: "Is the Gas Core Sample completely in Base?", points: 10, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m054 = MissionDetail(task: "Is the Water Core Sample placed so it is only supported by the Food Growth Chamber?", points: 8, switchOn: false, tag: 2, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m05 = Mission(code: "M05", description: "Extraction", details: [m051,m052, m053, m054])
        
        
        //M06
        let m061 = MissionDetail(task: "Is the Cone Module completely in Base?", points: 16, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m062 = MissionDetail(task: "Is the Tube Module inserted into the west side of the Habitation Hub?", points: 16, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m063 = MissionDetail(task: "Is the Dock Module transferred/inserted into the east side of the Habitation Hub?", points: 14, switchOn: false, tag: 2, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m06 = Mission(code: "M06", description: "Space Station Modules", details: [m061,m062, m063])
        
        //M07
        let m071 = MissionDetail(task: "Is Gerhard inserted partially into the Habitation Hub's Airlock Chamber?", points: 18, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m072 = MissionDetail(task: "Is Gerhard inserted completely into the Habitation Hub's Airlock Chamber?", points: 22, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m07 = Mission(code: "M07", description: "Space Walk Emergency", details: [m071, m072])
        
        //M08
        let m081 = MissionDetail(task: "Is the Exercise pointer tip completely in orange, or partly covering either of the orange end-borders?", points: 22, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m082 = MissionDetail(task: "Is the Exercise pointer tip completely in white?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m083 = MissionDetail(task: "Is the Exercise pointer tip completely in grey, or partly covering either of the grey end-borders?", points: 18, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m08 = Mission(code: "M08", description: "Aerobic Exercise", details: [m081,m082,m083])
        
        //M09
        let m091 = MissionDetail(task: "Is the Strength Bar lifted so the tooth-strip’s 4th hole comes at least partly into view?", points: 16, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m09 = Mission(code: "M09", description: "Strength Exercise", details: [m091])
        
        //M10
        let m101 = MissionDetail(task: "Is the Food Growth Chamber’s colors spun so the grey weight is DROPPED after green, but before tan using the Push Bar?", points: 16, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m10 = Mission(code: "M10", description: "Food Production", details: [m101])
        
        //M11
        let m111 = MissionDetail(task: "Is the spacecraft moved so fast and high that it stays up, by pressing/hitting the Strike Pad?", points: 24, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m11 = Mission(code: "M11", description: "Escape Velocity", details: [m111])
        
        //M12
        let m121 = MissionDetail(task: "Satellites on or above the area between the two lines of Outer Orbit:", points: 8, switchOn: false, tag: 0, stepper: true, maxStepperValue: 3, currentStepperValue: 0)
        let m12 = Mission(code: "M12", description: "Satellite Orbits", details: [m121])
       
        //M13
        let m131 = MissionDetail(task: "Is the Observatory pointer tip completely in orange, or partly covering either of the orange end-borders?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m132 = MissionDetail(task: "Is the Observatory pointer tip completely in white?", points: 18, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m133 = MissionDetail(task: "Is the Observatory pointer tip completely in grey, or partly covering either of the grey end-borders?", points: 16, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m13 = Mission(code: "M13", description: "Observatory", details: [m131,m132, m133])
        
        //M14
        let m141 = MissionDetail(task: "Meteoroids touching the Mat and in the Center Section", points: 12, switchOn: false, tag: 0, stepper: true, maxStepperValue: 2, currentStepperValue: 0)
        let m142 = MissionDetail(task: "Meteoroids touching the Mat and in Either Side Section:", points: 8, switchOn: false, tag: 0, stepper: true, maxStepperValue: 2, currentStepperValue: 0)
        let m14 = Mission(code: "M14", description: "Meteoroid Deflection", details: [m141,m142])
        
        //M15
        let m151 = MissionDetail(task: "Is the Lander intact, touching the Mat, and completely in its Target Circle?", points: 22, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m152 = MissionDetail(task: "Is the Lander intact, touching the Mat, and completely in the Northeast Planet Area?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        let m153 = MissionDetail(task: "Are both parts of the Lander completely in Base?", points: 16, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0)
        
        let m15 = Mission(code: "M15", description: "Lander Touch-Down", details: [m151,m152, m153])
        
        return [m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, m13, m14, m15]
    }
}
