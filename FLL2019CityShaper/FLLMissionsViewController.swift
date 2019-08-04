//
//  FLLMissions.swift
//  FLLScoreSheet
//
//  Created by AnishG on 5/5/19.
//  Copyright © 2019 Future Programmers. All rights reserved.
//

import Foundation
import UIKit

class FLLMissionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var penalty = 0
    var totalScore = 0
    
    @IBAction func penaltyHandler(_ sender: UIStepper) {
        penalty = Int(sender.value * -5)
        calculateTotalScore()
        penaltyLabel.text = "Penalty: \(String(Int(sender.value)))"
    }
    
    @IBOutlet weak var penaltyLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    
    var colorArray = [UIColor(red: 59/255, green: 41/255, blue: 203/255, alpha: 1).cgColor, UIColor(red: 142/255, green: 132/255, blue: 244/255, alpha: 1).cgColor]
    
    var missionModels: [Mission] = []
    var colorModels: [ColorModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        missionModels = loadMissionModels()
        calculateTotalScore()
        colorModels = loadColors()
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func handleReset(_ sender: UIButton) {
        missionModels = loadMissionModels()
        calculateTotalScore()
        tableView.reloadData()
        scrollToFirstRow()
    }
    func scrollToFirstRow() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
}
extension FLLMissionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionModels.count
    }
    
    func getPrimaryColor(for row: Int) -> CGColor {
        return colorModels[row % 8].colors[0]
        
    }
    
    func getSecondaryColor(for row: Int) -> CGColor {
        
        return colorModels[row % 8].colors[1]
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionCell") as? FLLMissionTableViewCell
        cell?.delegate = self
        //  cell.configure(mission: missionModels[indexPath.row], row: indexPath.row)
        let layer = CAGradientLayer()
        layer.colors = [getPrimaryColor(for: indexPath.row), getSecondaryColor(for: indexPath.row)]
        layer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        layer.zPosition = -1
        cell?.layer.addSublayer(layer)
        cell?.configure(mission: missionModels[indexPath.row])
        return cell!
        
    }

    
}

extension FLLMissionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee.y = self.view.frame.height * round(targetContentOffset.pointee.y / self.view.frame.height)
    }
}

extension FLLMissionsViewController: FLLMissionTableViewCellDelegate {
    func didUpdateMission(mission: Mission) {
        let index = missionModels.firstIndex { (originalMission) -> Bool in
            return mission.code == originalMission.code
        }
        if let index = index {
            missionModels[index] = mission
            calculateTotalScore()
            let indexPath = IndexPath(row: index, section: 0)
            UIView.setAnimationsEnabled(false)
            tableView.reloadRows(at: [indexPath], with: .none)
            UIView.setAnimationsEnabled(true)
        }
        
    }

    func calculateTotalScore() {
        self.missionModels[0].subTotal = 0
        var advantageSubTotal = 0
        totalScore = 0
        var addAdvantagePoints = false
        for mission in missionModels {
            totalScore += mission.subTotal
            if mission.code == "Advantage" {
                if mission.details[0].switchOn {
                    addAdvantagePoints = true
                }
            } else if mission.code != "M14" && mission.subTotal > 0 && addAdvantagePoints {
                if mission.code == "M02" {
                    advantageSubTotal += 10
                } else {
                    advantageSubTotal += 5
                }
            }
            
        }
        totalScore += advantageSubTotal
        self.missionModels[0].subTotal = advantageSubTotal
      totalScoreLabel.text = String(totalScore)
    }
    
}
