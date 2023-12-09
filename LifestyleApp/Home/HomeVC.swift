//
//  HomeVC.swift
//  LifestyleApp
//
//  Created by ZYY on 12/7/23.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        
        // MARK: 1. 整体bar--在sb上设置
        
        // 2. selectedBar--按钮下方条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main1")!
        settings.style.selectedBarHeight = 3
        
        // 3. buttonBarItem--文本或图片按钮
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 17)
        settings.style.buttonBarItemLeftRightMargin = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        
        containerView.bounces = false
        
        super.viewDidLoad()

        // MARK: has warning
//        DispatchQueue.main.async {
//            self.moveToViewController(at: 1, animated: false)
//        }
//
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let nearByVC = storyboard!.instantiateViewController(identifier: kNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        
        return [discoveryVC, followVC, nearByVC]
    }
    
}
