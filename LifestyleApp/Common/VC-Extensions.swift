//
//  VC-Extensions.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import Foundation

extension UIViewController {
    func add(child vc: UIViewController){
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    func remove(child vc: UIViewController){
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
    func removeChildren(){
        if !children.isEmpty{
            for vc in children{
                remove(child: vc)
            }
        }
    }
}
