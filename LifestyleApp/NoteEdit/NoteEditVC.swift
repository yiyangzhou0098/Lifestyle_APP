//
//  NoteEditVC.swift
//  LifestyleApp
//
//  Created by ZYY on 12/9/23.
//

import UIKit
import YPImagePicker
import MBProgressHUD

class NoteEditVC: UIViewController {


    
    var photos = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoCount: Int{ photos.count }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NoteEditVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        
        cell.imageView.image = photos[indexPath.item]
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            
            photoFooter.addPhotoBtn.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            
            return photoFooter
        default:
            fatalError("Footer of collectionView failed")
        }
    }
}

//MARK: listen
extension NoteEditVC {
    @objc private func addPhoto(sender: UIButton) {
        if photoCount < kMaxPhotoCount {
            // MARK: picker configurate
            var config = YPImagePickerConfiguration()
            config.albumName = "Lifeyou Album"
            config.startOnScreen = .library
            config.screens = [.library]
            
            // MARK: library configuration
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = kSpacingBetweenItems
            config.gallery.hidesRemoveButton = false
            
            // MARK: video configuration
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking {[unowned picker] items, _ in
                    
                for item in items {
                    if case let .photo(photo) = item {
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                    
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        } else {
            MBProgressHUD.showAdded(to: view, animated: true)
        }
    }
}
  
extension NoteEditVC: UICollectionViewDelegate {
    
}
