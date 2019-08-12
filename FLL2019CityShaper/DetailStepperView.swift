//
//  DetailStepper.swift
//  FLLScoreSheet
//
//  Created by Mekhala Vithala on 7/24/19.
//  Copyright © 2019 Future Programmers. All rights reserved.
//

import Foundation
import UIKit

class DetailStepperView: UIView {
    
    @IBOutlet weak var taskLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    weak var delegate: DetailStepperViewDelegate?
    @IBAction func stepperChanged(_ sender: UIStepper) {
        stepperLabel.text = String(Int(sender.value))
        delegate?.didUpdateStepperValue(task: taskLabel.text ?? "", value: Int(sender.value))
    }
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func loadNibView() {
        let detailNib = UINib(nibName: "DetailStepperView", bundle: nil)
        if let detailView = detailNib.instantiate(withOwner: self, options: nil).first as? UIView {
            self.addSubview(detailView)
        }
        
    }
}
protocol DetailStepperViewDelegate: class {
    func didUpdateStepperValue(task: String, value: Int) 
}
