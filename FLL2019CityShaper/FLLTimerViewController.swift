//
//  FLLTimerViewController.swift
//  FLL2019CityShaper
//
//  Created by user141824 on 8/25/19.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit

class FLLTimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
