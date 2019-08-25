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
    
    var totalScore = 0
    
    @IBOutlet weak var penaltyLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    var colorArray = [UIColor(red: 59/255, green: 41/255, blue: 203/255, alpha: 1).cgColor, UIColor(red: 142/255, green: 132/255, blue: 244/255, alpha: 1).cgColor]
    
    let imageArray = ["M0", "M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9", "M10", "M11", "M12", "M13", "M14"]
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @IBAction func handleReset(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Restart Scoring?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            self.missionModels = self.loadMissionModels()
            self.calculateTotalScore()
            self.tableView.reloadData()
            self.scrollToFirstRow()
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        let layer = CAGradientLayer()
        layer.colors = [getPrimaryColor(for: indexPath.row), getSecondaryColor(for: indexPath.row)]
        layer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        layer.zPosition = -1
        cell?.layer.addSublayer(layer)
        cell?.configure(mission: missionModels[indexPath.row])
        cell?.missionImageView.image = UIImage(named: imageArray[indexPath.row])
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
    func shouldGoToMainViewController() {
        navigationController?.popViewController(animated: true)
    }
    
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

extension UIImage {
    func grayscaleImage() -> UIImage? {
        let ciImage = CIImage(image: self)
        if let grayscale = ciImage?.applyingFilter("CIColorControls",
                                                   parameters: [ kCIInputSaturationKey: 0.0 ]) {
            return UIImage(ciImage: grayscale)
        } else {
            return nil
        }
    }
}
