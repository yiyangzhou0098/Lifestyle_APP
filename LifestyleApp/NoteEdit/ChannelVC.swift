//
//  ChannelVC.swift
//  LifestyleApp
//
//  Created by ZYY on 12/11/23.
//

import UIKit
import XLPagerTabStrip

class ChannelVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        for x in kChannels {
            let vc = storyboard!.instantiateViewController(identifier: )
        }
        
        return vcs
    }
    
    
}
