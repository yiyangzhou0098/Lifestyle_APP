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
        
        if viewController is PostVC {
            
            // TODO: check login status
            
            // MARK: picker configurate
            var config = YPImagePickerConfiguration()
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.usesFrontCamera = true
            config.albumName = "Lifeyou Album"
            config.startOnScreen = .photo
            config.screens = [.library, .video, .photo]
            
            // MARK: library configuration
            config.library.mediaType = .photoAndVideo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = kSpacingBetweenItems
            config.gallery.hidesRemoveButton = false
            
            // MARK: video configuration
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking {[unowned picker] items, cancelled in
                if cancelled {
                    picker.dismiss(animated: true)
                } else {
                    var photos: [UIImage] = []
                    var videoURL: URL?
                    
                    for item in items {
                        switch item {
                        case let .photo(p: photo):
                            photos.append(photo.image)
                        case .video:
                            let url = URL(fileURLWithPath: "recordedVideoRAW.mov", relativeTo: FileManager.default.temporaryDirectory)
                            photos.append(url.thumbnail)
                            videoURL = url
                        }
                    }
                    let vc = self.storyboard!.instantiateViewController(identifier: kNoteEditVCID) as! NoteEditVC
                    vc.photos = photos
                    vc.videoURL = videoURL
                    picker.pushViewController(vc, animated: true)
                }
            }
            present(picker, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

    
