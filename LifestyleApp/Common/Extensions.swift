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

extension UIViewController {
    
    // MARK: Loading popover - auto hide
    func showTextHUD(_ title: String, _ inCurrentView: Bool = true, _ subTitle: String? = nil){
        var viewToShow = view!
        if !inCurrentView{
            viewToShow = UIApplication.shared.windows.last!
        }
        let hud = MBProgressHUD.showAdded(to: viewToShow, animated: true)
        hud.mode = .text //不指定的话显示菊花和下面配置的文本
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
    
    // Mark: Textfield related
    func hideKeyBoardWhenTapperAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

