//
//  FLLMainViewController.swift
//  FLL2019CityShaper
//
//  Created by user141824 on 8/25/19.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit

class FLLMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
