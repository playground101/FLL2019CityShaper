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
    var subTotal:Int
}

struct MissionDetail {
    var id: String
    var task: String
    var points: Int
    var switchOn: Bool
    var tag: Int
    var stepper: Bool
    var maxStepperValue: Int
    var currentStepperValue: Int
    var dependency:Dependency?
}
struct Dependency {
    var parent: String
    var child: String
}

extension FLLMissionsViewController {
    
    func loadMissionModels() -> [Mission] {
        //Advantage
        let m00 = MissionDetail(id: "advantage", task: "Does your Robot and Equipment fit in the Small Inspection Area?", points: 5, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m0 = Mission(code: "Advantage", description: "", details: [m00], subTotal: 0)
        //M01
        let m011 = MissionDetail(id: "m011", task: "Is the robot supported by the bridge?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m012 = MissionDetail(id: "m012", task: "Number of flags that are clearly raised any distance, only by the robot:", points: 15, switchOn: false, tag: 1, stepper: true, maxStepperValue: 2, currentStepperValue: 0, dependency: nil)
        let m01 = Mission(code: "M01", description: "Elevated Places", details: [m011, m012], subTotal: 0)
        
        //M02
        let m021 = MissionDetail(id: "m021", task: "Is the Hooked Blue Unit clearly lowered any distance from the Guide Hole?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m022 = MissionDetail(id: "m022", task: "Is the Hooked Blue Unit Independent and Supported by another Blue Unit?", points: 15, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: Dependency(parent: "m022", child: "m023"))
        let m023 = MissionDetail(id: "m023", task: "AND is Level 1 Completely in the Blue Circle?", points: 15, switchOn: false, tag: 2, stepper: false, maxStepperValue: 0, currentStepperValue:0, dependency: Dependency(parent: "m022", child: "m023"))
        let m02 = Mission(code: "M02", description: "Crane", details: [m021, m022, m023], subTotal: 0)
        
        //M03
        let m031 = MissionDetail(id:"m031", task: "Is the Inspection Drone Supported by the axle on the Bridge?", points: 10, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m03 = Mission(code: "M03", description: "Inspection Drone", details: [m031], subTotal: 0)
        
        //M04
        let m041 = MissionDetail(id: "m041", task: "Is the Bat Supported by the branch on the Tree?", points: 10, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m04 = Mission(code: "M04", description: "Design For Wildlife", details: [m041], subTotal: 0)
        
        //M05
        let m051 = MissionDetail(id: "m051", task: "Number of Units Independent and Supported by the Tree's Large Branches:", points: 10, switchOn: false, tag: 0, stepper: true, maxStepperValue: 16, currentStepperValue: 0, dependency: nil)
        let m052 = MissionDetail(id: "m052", task: "Number of Units Independent and Supported by the Tree's Small Branches:", points: 15, switchOn: false, tag: 1, stepper: true, maxStepperValue: 16, currentStepperValue: 0, dependency: nil)
        let m05 = Mission(code: "M05", description: "Treehouse", details: [m051,m052], subTotal: 0)
        
        
        //M06
        let m061 = MissionDetail(id: "m061", task: "Is the Traffic Jam lifted, its moving part Independent, and Supported only by its hinges:", points: 10, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m06 = Mission(code: "M06", description: "Traffic Jam", details: [m061], subTotal: 0)
        
        //M07
        let m071 = MissionDetail(id: "m071", task: "Is the Swing released?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m07 = Mission(code: "M07", description: "Swing", details: [m071], subTotal: 0)
       
        //M08
        let m081 = MissionDetail(id: "m081", task: "Are the Elevator’s moving parts Independent and Supported only by its hinges in the Blue Car Down position?", points: 15, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m082 = MissionDetail(id: "m082", task: "Are the Elevator’s moving parts Independent and Supported only by its hinges in the Balanced position?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m08 = Mission(code: "M08", description: "Elevator", details: [m081,m082], subTotal: 0)
        
        //M09
        let m091 = MissionDetail(id: "m091", task: "Is the Test Building Independent and Supported only by the blue beams?", points: 0, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: Dependency(parent: "m091", child: "m092"))
        let m092 = MissionDetail(id: "m092", task: "Number of blue beams knocked out at least half way:", points: 10, switchOn: false, tag: 0, stepper: true, maxStepperValue: 6, currentStepperValue: 0, dependency: Dependency(parent: "m091", child: "m092"))
        let m09 = Mission(code: "M09", description: "Safety Factor", details: [m091, m092], subTotal: 0)
        
        //M10
        let m101 = MissionDetail(id: "m101", task: "Is the Steel Structure standing, and is Independent and Supported only by its hinges?", points: 20, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m10 = Mission(code: "M10", description: "Steel Construction", details: [m101], subTotal: 0)
        
        //M11
        let m111 = MissionDetail(id: "m111", task: "Is the Structure bigger than a Blue Building Unit and built from the team’s white LEGO bricks?", points: 0, switchOn: false, tag: 0, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m112 = MissionDetail(id: "m112", task: "Is the Structure partly in any circle?", points: 10, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m113 = MissionDetail(id: "m113", task: "Is the Structure completely in any circle?", points: 15, switchOn: false, tag: 1, stepper: false, maxStepperValue: 0, currentStepperValue: 0, dependency: nil)
        let m11 = Mission(code: "M11", description: "Innovative Architecture", details: [m111, m112, m113], subTotal: 0)
        
        //M12
        let m121 = MissionDetail(id: "m121", task: "Number of Circles with a color-matching Unit, flat down on the Mat, and Completely in Circle:", points: 10, switchOn: false, tag: 0, stepper: true, maxStepperValue: 3, currentStepperValue: 0, dependency: nil)
        let m122 = MissionDetail(id: "m122", task: "Sum of height Levels of Independent Stacks at least partly in any Circle:", points: 4, switchOn: false, tag: 1, stepper: true, maxStepperValue: 4, currentStepperValue: 0, dependency: nil)
        let m12 = Mission(code: "M12", description: "Design and Build", details: [m121, m122], subTotal: 0)
       
        //M13
        let m131 = MissionDetail(id: "m131", task: "Number of Upgrades that are Independent and Supported only by a Stack which is at least partly in a Circle:", points: 10, switchOn: false, tag: 0, stepper: true, maxStepperValue: 3, currentStepperValue: 0, dependency: nil)
        let m13 = Mission(code: "M13", description: "Sustainablity Upgrades", details: [m131], subTotal: 0)
        
        //M14
        let m141 = MissionDetail(id: "m141", task: "Number of Precision Tokens left on the field:", points: 5, switchOn: false, tag: 0, stepper: true, maxStepperValue: 6, currentStepperValue: 6, dependency: nil)
        let m14 = Mission(code: "M14", description: "Precision", details: [m141], subTotal: 60)
 
        return [m0, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, m13, m14]
 
    }
}

