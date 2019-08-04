//
//  ViewController.swift
//  FLLScoreSheet
//
//  Created by AnishG on 5/19/19.
//  Copyright © 2019 Future Programmers. All rights reserved.
//

import UIKit

class FLLMissionTableViewCell: UITableViewCell {
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    let mission14 = [0, 5, 10, 20, 30, 45, 60]
    @IBOutlet weak var missionScoreLabel: UILabel!
    
    var mission: Mission?
    var delegate: FLLMissionTableViewCellDelegate?
    
    func configure(mission: Mission)  {
        self.mission = mission
        codeLabel.text = mission.code
        descriptionLabel.text = mission.description
        let count = mission.details.count
        stackViewHeight.constant = CGFloat((count * 20 ) +  (count * 100))
        
        let details = mission.details
        let dependencyIndex = details.firstIndex { (detail) -> Bool in
            return detail.dependency != nil
        }
        var dependency: Dependency?
        var dependencyOn = false
        if let index = dependencyIndex {
            dependency = details[index].dependency
            dependencyOn = details[index].switchOn
            
        }
        for detail in details {
            let id = detail.id
            if detail.stepper {
                let stepperView = DetailStepperView(frame: CGRect.zero)
                stepperView.delegate = self
                stepperView.stepperLabel.text = String(detail.currentStepperValue)
                stepperView.stepper.maximumValue = Double(detail.maxStepperValue)
                stepperView.stepper.value = Double(detail.currentStepperValue)
                stepperView.taskLabel.text = detail.task
                if id == dependency?.child {
                    stepperView.isUserInteractionEnabled = false
                    if dependencyOn {
                        stepperView.isUserInteractionEnabled = true
                    }
                }
                stackView.addArrangedSubview(stepperView)
            } else {
                let detailView = DetailView(frame: CGRect.zero)
                detailView.delegate = self
                detailView.taskLabel.text = detail.task
                detailView.taskSwitch.isOn = detail.switchOn
                self.missionScoreLabel.text = String(0)
                if id == dependency?.child {
                    detailView.isUserInteractionEnabled = false
                    if dependencyOn {
                        detailView.isUserInteractionEnabled = true
                    }
                }
                stackView.addArrangedSubview(detailView)
            }
        }
        calculateScore(mission: mission)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        for subview in stackView.subviews {
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        layoutIfNeeded()
    }
    
    func calculateScore(mission: Mission?) {
        guard let mission1 = mission else {
            return
        }
        if mission?.code == "Advantage" {
            self.missionScoreLabel.text = String(mission1.subTotal)
            return
        }
        var subTotal = 0
        for detail in mission1.details {
            if detail.switchOn {
                subTotal += detail.points
            } else if detail.stepper {
                if mission?.code == "M14" {
                    subTotal = mission14[detail.currentStepperValue]
                } else {
                    subTotal += detail.points * detail.currentStepperValue
                }
            }
           
        }
        self.missionScoreLabel.text = String(subTotal)
        self.mission?.subTotal = subTotal
    }
}

extension FLLMissionTableViewCell: DetailViewDelegate {
    
    func taskComplete(task: String?) {
        switchTaskType(isOn: true, task: task)
    }
    func taskIncomplete(task: String?) {
        switchTaskType(isOn: false, task: task)
    }
    
    fileprivate func mutuallyExclusiveTagFinder(_ index: Int?, _ isOn: Bool, isStepper: Bool, _ task: String?) {
        let detailTag = self.mission?.details[index ?? 0].tag
        if isOn {
            if let count = self.mission?.details.count {
                for i in 0...count - 1 {
                    if detailTag == self.mission?.details[i].tag && self.mission?.details[i].task != task {
                        self.mission?.details[i].switchOn = false
                    }
                }
            }
        } else if isStepper {
            if let count = self.mission?.details.count {
                let modifiedStepperValue = self.mission?.details[index ?? 0].currentStepperValue
                for i in 0...count - 1 {
                    if detailTag == self.mission?.details[i].tag {
                        if i != index {
                            let stepperValue = self.mission?.details[i].currentStepperValue
                            switch modifiedStepperValue {
                            case 1:
                                if stepperValue == 2 {
                                    self.mission?.details[i].currentStepperValue = 1
                                }
                            case 2:
                                self.mission?.details[i].currentStepperValue = 0
                            default:
                                break
                            }
                        }
                    }
                }
            }
        }
    }
    fileprivate func checkDependency(_ index: Int?, _ isOn: Bool) {
        if let parent = self.mission?.details[index ?? 0].dependency?.parent,
            parent == self.mission?.details[index ?? 0].id, !isOn {
            if let child = self.mission?.details[index ?? 0].dependency?.child {
                let childIndex =  self.mission?.details.firstIndex { (detail) -> Bool in
                    return child == detail.id
                }
                resetSwitch(index: childIndex ?? 0)
                resetStepper(index: childIndex ?? 0)
            }
        }
    }
    
    func switchTaskType(isOn: Bool, task: String?) {
        if let mission = self.mission {
            let details = mission.details
            let index = details.firstIndex { (detail) -> Bool in
                return detail.task == task
            }
            checkDependency(index, isOn)
            self.mission?.details[index ?? 0].switchOn = isOn
            mutuallyExclusiveTagFinder(index, isOn, isStepper: false, task)
            calculateScore(mission: self.mission)
            if let missionInstance = self.mission {
                delegate?.didUpdateMission(mission: missionInstance)
            }
        }
    }
}

protocol FLLMissionTableViewCellDelegate: class {
    func didUpdateMission(mission: Mission) 
}

extension FLLMissionTableViewCell: DetailStepperViewDelegate {
    func didUpdateStepperValue(task: String, value: Int) {
        let index = mission?.details.firstIndex(where: { (detail) -> Bool in
            return task == detail.task
        })
        self.mission?.details[index ?? 0].currentStepperValue = value
        mutuallyExclusiveTagFinder(index, false, isStepper: true, task)
        calculateScore(mission: self.mission)
        if let missionInstance = self.mission {
            delegate?.didUpdateMission(mission: missionInstance)
        }
    }
}
extension FLLMissionTableViewCell {
    func resetSwitch(index: Int) {
        self.mission?.details[index].switchOn = false
        
    }
    func resetStepper(index: Int) {
        self.mission?.details[index].currentStepperValue = 0
    }
}


