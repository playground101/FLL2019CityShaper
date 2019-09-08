//
//  FLLMasterTableViewController.swift
//  FLL2019CityShaper
//
//  Created by user141824 on 9/1/19.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit

class FLLMasterTableViewController: UITableViewController {
    let sections = ["Tools","FLL Links"]
    let tools = ["Scorer"]
    let fllLinks = ["Challenge Updates", "Game Guide", "Participation Rules", "Rubrics"]
    let fllWebLinks = ["https://firstinspiresst01.blob.core.windows.net/fll/2020/city-shaper-challenge-updates.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/city-shaper-game-guide-pdf.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/first-lego-league-participation-rules.pdf", "https://firstinspiresst01.blob.core.windows.net/fll/2020/first-lego-league-rubrics.pdf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return tools.count
        } else {
            return fllLinks.count
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Futura", size: 18)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = tools[indexPath.row]
        } else {
            cell.textLabel?.text = fllLinks[indexPath.row]
        }
        
        /* switch indexPath.row {
         case 0:
         cell.textLabel?.text = "Scorer"
         case 1:
         cell.textLabel?.text = "Timer"
         case 2:
         cell.textLabel?.text = "FLL Links"
         case 3:
         cell.textLabel?.text = "Developers"
         case 4:
         cell.textLabel?.text = "Strategy"
         default:
         cell.textLabel?.text = "Resources"
         } */
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "FLLMissions", bundle: nil)
        if indexPath.section == 1 {
            let linksController = storyBoard.instantiateViewController(withIdentifier: "flllinks") as! FLLLinksViewController
            linksController.fllURL = URL(string: fllWebLinks[indexPath.row])
            splitViewController?.showDetailViewController(linksController, sender: nil)
        } else {
            splitViewController?.showDetailViewController(storyBoard.instantiateViewController(withIdentifier: "scorer"), sender: nil)
        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
