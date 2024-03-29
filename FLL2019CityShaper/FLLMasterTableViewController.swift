//
//  FLLMasterTableViewController.swift
//  FLL2019CityShaper
//
//  Created by user141824 on 9/1/19.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import MessageUI
class FLLMasterTableViewController: UITableViewController {
    var scorer: FLLMissionsViewController?
    let sections = ["Tools","FLL Links", "Email FIRST LEGO League", "Mission Building Instructions"]
    let tools = ["Scorer"]
    let fllLinks = ["CITY SHAPER Challenge", "Challenge Updates", "Game Guide", "Participation Rules", "Rubrics", "Project Resources"]
    let fllWebLinks = ["https://firstinspiresst01.blob.core.windows.net/fll/2020/city-shaper-challenge.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/city-shaper-challenge-updates.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/city-shaper-game-guide-pdf.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/first-lego-league-participation-rules.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/first-lego-league-rubrics.pdf", "https://fllblog.wordpress.com/2019/08/09/resources-to-build-your-innovation-project/"]
    let contactTitleArray = ["Robot Game questions", "Project questions", "Judging questions", "Team questions"]
    let contactEMailArray = ["fllrobotgame@firstinspires.org", "fllprojects@firstinspires.org", "flljudge@firstinspires.org", "firstlegoleague@firstinspires.org"]
    let bagTitles = ["Bag 1: Bat, Precision Tokens, Inspection Drone, Bridge Entrance, Bridge Top", "Bag 2: Bridge Ramp", "Bag 3: Steel Structure, Tree", "Bag 4: Crane", "Bag 5: Red Building Units", "Bag 6: Tan Building Units", "Bag 7: White Building Units, Blue Building Units, Building Upgrades", "Bag 8: Test Building, Elevator", "Bag 9: Swing, Traffic Jam", "Bag 10: Innovation Elements"]
    let bagTitleLinks = ["https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book1_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book2_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book3_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book4_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book5_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book6_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book7_ENUS_19Aug2019.pdf" , "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book8_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book9_ENUS_19Aug2019.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/mission-models/english/45809_Book10_ENUS_19Aug2019.pdf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor(red: 37/255, green: 19/255, blue: 82/255, alpha: 1)
        tableView.backgroundView?.backgroundColor = color
        tableView.backgroundColor = color
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let robotView = UIImageView(image: UIImage(named: "M0.png"))
        //robotView.frame = (tableView.backgroundView?.frame)!
        robotView.alpha = 0.2
        robotView.contentMode = .scaleAspectFill
        tableView.backgroundView = robotView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return tools.count
        } else if section == 1 {
            return fllLinks.count
        } else if section == 2 {
            return contactTitleArray.count
        } else {
            return bagTitleLinks.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Futura", size: 18)
        cell.textLabel?.textColor = .white
        if indexPath.section == 0 {
            cell.textLabel?.text = tools[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = fllLinks[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = contactTitleArray[indexPath.row]
        } else {
            cell.textLabel?.text = bagTitles[indexPath.row]
        }
        cell.textLabel?.numberOfLines = 0
        let colorView = UIView(frame: cell.frame)
        colorView.backgroundColor = UIColor(red: 142/255, green: 132/255, blue: 244/255, alpha: 0.3)
        cell.selectedBackgroundView = colorView
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "FLLMissions", bundle: nil)
        if indexPath.section == 1 {
            if fllLinks[indexPath.row] == "Project Resources" {
                if let url = URL(string: fllWebLinks[indexPath.row]) {
                    UIApplication.shared.open(url)
                }
            } else {
                let linksController = storyBoard.instantiateViewController(withIdentifier: "flllinks") as! FLLLinksViewController
                linksController.fllURL = URL(string: fllWebLinks[indexPath.row])
                splitViewController?.showDetailViewController(linksController, sender: nil)
            }
        } else if indexPath.section == 2 {
            createMailComposer(recipient: contactEMailArray[indexPath.row])
        } else if indexPath.section == 3 {
            let linksController = storyBoard.instantiateViewController(withIdentifier: "flllinks") as! FLLLinksViewController
            linksController.fllURL = URL(string: bagTitleLinks[indexPath.row])
            splitViewController?.showDetailViewController(linksController, sender: nil)
        }
        else {
            if let scorer = scorer {
                splitViewController?.showDetailViewController(scorer, sender: nil)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60.0
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor(red: 142/255, green: 132/255, blue: 244/255, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "Futura-Bold", size: 20)
    }
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        //if section == 2 {
        let footer = view as! UITableViewHeaderFooterView
        footer.textLabel?.text = "TEST"
        
        //   }
    }
}
extension FLLMasterTableViewController: MFMailComposeViewControllerDelegate {
    func createMailComposer(recipient: String) {
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients([recipient])
            composeVC.setSubject("")
            composeVC.setMessageBody("", isHTML: false)
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
