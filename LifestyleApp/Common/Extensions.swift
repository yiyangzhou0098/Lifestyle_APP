//
//  Extensions.swift
//  LifestyleApp
//
//  Created by ZYY on 12/9/23.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var radius: CGFloat  {
        set {
            self.layer.cornerRadius = newValue
        }
        get { return self.layer.cornerRadius }
    }
    
}
