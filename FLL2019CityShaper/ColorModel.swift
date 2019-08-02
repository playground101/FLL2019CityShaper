//
//  ColorModel.swift
//  FLLScoreSheet
//
//  Created by user141824 on 6/30/19.
//  Copyright © 2019 Future Programmers. All rights reserved.
//

import Foundation
import UIKit

struct ColorModel {
    var screen: Int
    var colors: [CGColor] = []
}

extension FLLMissionsViewController {
    func loadColors() -> [ColorModel] {
        
        var colorModels: [ColorModel] = []
        
        let c1 = ColorModel(screen: 1, colors: [UIColor(red: 37/255, green: 19/255, blue: 82/255, alpha: 1).cgColor, UIColor(red: 59/255, green: 41/255, blue: 203/255, alpha: 1).cgColor])
        let c2 = ColorModel(screen: 2, colors: [UIColor(red: 59/255, green: 41/255, blue: 203/255, alpha: 1).cgColor, UIColor(red: 142/255, green: 132/255, blue: 244/255, alpha: 1).cgColor])
        let c3 = ColorModel(screen: 3, colors: [UIColor(red: 142/255, green: 132/255, blue: 244/255, alpha: 1).cgColor, UIColor(red: 238/255, green: 74/255, blue: 133/255, alpha: 1).cgColor])
        let c4 = ColorModel(screen: 4, colors: [UIColor(red: 238/255, green: 74/255, blue: 133/255, alpha: 1).cgColor, UIColor(red: 240/255, green: 79/255, blue: 86/255, alpha: 1).cgColor] )
        let c5 = ColorModel(screen: 5, colors: [UIColor(red: 240/255, green: 79/255, blue: 86/255, alpha: 1).cgColor, UIColor(red: 245/255, green: 128/255, blue: 62/255, alpha: 1).cgColor])
        let c6 = ColorModel(screen: 6, colors:  [UIColor(red: 245/255, green: 128/255, blue: 62/255, alpha: 1).cgColor, UIColor(red: 250/255, green: 181/255, blue: 44/255, alpha: 1).cgColor])
        let c7 = ColorModel(screen: 7, colors: [UIColor(red: 250/255, green: 181/255, blue: 44/255, alpha: 1).cgColor, UIColor(red: 193/255, green: 218/255, blue: 102/255, alpha: 1).cgColor] )
        let c8 = ColorModel(screen: 8, colors: [UIColor(red: 193/255, green: 218/255, blue: 102/255, alpha: 1).cgColor, UIColor(red: 37/255, green: 19/255, blue: 82/255, alpha: 1).cgColor])
        
        colorModels = [c1, c2, c3, c4, c5, c6, c7, c8]
        return colorModels
    }
 }
