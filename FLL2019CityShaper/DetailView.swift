//
//  DetailView.swift
//  FLLScoreSheet
//
//  Created by user141824 on 7/13/19.
//  Copyright © 2019 Future Programmers. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    var delegate: DetailViewDelegate?
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskSwitch: UISwitch!
    
    @IBAction func scoreCalc(_ sender: UISwitch) {
        if sender.isOn {
            delegate?.taskComplete(task: taskLabel.text)
        } else {
            delegate?.taskIncomplete(task: taskLabel.text)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    fileprivate func loadNibView() {
        let detailNib = UINib(nibName: "DetailView", bundle: nil)
        if let detailView = detailNib.instantiate(withOwner: self, options: nil).first as? UIView {
            self.addSubview(detailView)
        }
        
    }
}


protocol DetailViewDelegate: class {
    func taskComplete(task: String?)
    func taskIncomplete(task: String?)
}
