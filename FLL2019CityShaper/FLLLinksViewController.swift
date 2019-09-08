//
//  FLLLinksViewController.swift
//  FLL2019CityShaper
//
//  Created by user141824 on 8/25/19.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import WebKit
class FLLLinksViewController: UIViewController {
    
 var fllURL = URL(string: "https://firstinspiresst01.blob.core.windows.net/fll/2020/city-shaper-game-guide-pdf.pdf")
    
    var webView: WKWebView!
    override func  loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self as? WKUIDelegate
        view = webView
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myRequest = URLRequest(url: fllURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    

}
