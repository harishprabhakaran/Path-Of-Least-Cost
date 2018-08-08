//
//  View+Extension.swift
//  PathOfLeastCost
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation
import UIKit

//MARK:- UIView extension
extension UIView {
    
    /// To add Gray color and set the border properties
    func addLightGrayBorder() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(red: 233/258, green: 233/258, blue: 233/258, alpha: 1.0).cgColor
    }
    
}
