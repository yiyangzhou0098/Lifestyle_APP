//
//  TabBarc.swift
//  LifestyleApp
//
//  Created by ZYY on 12/8/23.
//

import UIKit
import YPImagePicker

class TabBarC : UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? PostVC {
            let picker = YPImagePicker()
            picker.didFinishPicking {[unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    
                    // MARK: picker configurate
                    var config = YPImagePickerConfiguration()
                    config.isScrollToChangeModesEnabled = false
                    config.onlySquareImagesFromCamera = false
                    config.usesFrontCamera = true
                    config.albumName = "Lifeyou Album"
                    
                    print(photo.fromCamera)
                    print(photo.image)
                    print(photo.originalImage)
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}
