//
//  NoteEditVC-CollectionView.swift
//  LifestyleApp
//
//  Created by ZYY on 12/10/23.
//

import YPImagePicker
import MBProgressHUD
import SKPhotoBrowser
import AVKit

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
            self.showTextHUD("Only can select \(kMaxPhotoCount) pictures")
        }
    }
}
  
extension NoteEditVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isVideo {
            let playerVC = AVPlayerViewController()
//            playerVC.player = AVPlayer(url: videoURL)
//            present(playerVC, animated: true) {
//                playerVC.player?.play()
//            }
        } else {
            var images = [SKPhoto]()
            
            for photo in photos {
                images.append(SKPhoto.photoWithImage(photo))
            }
            
            let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
            browser.delegate = self
            SKPhotoBrowserOptions.displayAction = false
            SKPhotoBrowserOptions.displayDeleteButton = true
            
            present(browser, animated: true, completion: {})
        }

    }
}

// MARK: SKphotoBroswer delegate
extension NoteEditVC: SKPhotoBrowserDelegate {
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()
    }
}
