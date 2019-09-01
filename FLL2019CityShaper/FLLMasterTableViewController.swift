//
//  FLLMasterTableViewController.swift
//  FLL2019CityShaper
//
//  Created by user141824 on 9/1/19.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit

class FLLMasterTableViewController: UITableViewController {
    
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Futura", size: 20)
        
        switch indexPath.row {
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
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "FLLMissions", bundle: nil)
        switch indexPath.row {
        case 0: splitViewController?.showDetailViewController(storyBoard.instantiateViewController(withIdentifier: "scorer"), sender: nil)
        case 1:
        splitViewController?.showDetailViewController(storyBoard.instantiateViewController(withIdentifier: "timer"), sender: nil)
        case 2:
        splitViewController?.showDetailViewController(storyBoard.instantiateViewController(withIdentifier: "flllinks"), sender: nil)
        case 3:
        splitViewController?.showDetailViewController(storyBoard.instantiateViewController(withIdentifier: "developer"), sender: nil)
        case 4:
        splitViewController?.showDetailViewController(storyBoard.instantiateViewController(withIdentifier: "strategy"), sender: nil)
        default: break
            
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
