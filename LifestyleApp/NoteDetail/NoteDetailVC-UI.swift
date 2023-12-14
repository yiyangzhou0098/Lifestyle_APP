//
//  NoteDetailVC-UI.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import Foundation
import ImageSlideshow
import Kingfisher

extension NoteDetailVC {
    func setUI() {
        showNote()
    }
    
    private func showNote() {
        let authorAvatarURL = author?.getImageURL(from: kAvatarCol, .avatar)
        authorAvatarBtn.kf.setImage(with: authorAvatarURL, for: .normal)
        
        authorNickNameBtn.setTitle(author?.getExactStringVal(kNickNameCol), for: .normal)
        
        // Note Photos
        let coverPhotoHeight = CGFloat(note.getExactDoubelVal(kCoverPhotoRatioCol)) * screenRect.width
        imageSlideShowHeight.constant = coverPhotoHeight
        
        // use coverphoto as the first photo of detail to speedup load
        let coverPhoto = KingfisherSource(url: note.getImageURL(from: kCoverPhotoCol, .coverPhoto))
        if let photoPaths = note.get(kPhotosCol)?.arrayValue as? [String] {
            var photoPathsArr = photoPaths.compactMap{ KingfisherSource(urlString: $0) }
            // like ["http://1.jpg", "http://2.jpg"]
            photoPathsArr[0] = coverPhoto
            imageSlideshow.setImageInputs(photoPathsArr)
        }
        
        let noteTitle = note.getExactStringVal(kTitleCol)
        if noteTitle.isEmpty {
            titleLabel.isHidden = true
        } else {
            titleLabel.text = noteTitle
        }
        
        let noteChannel = note.getExactStringVal(kChannelCol)
        if noteChannel.isEmpty {
            channelBtn.isHidden = true
        } else {
            channelBtn.setTitle(noteChannel, for: .normal)
        }
        
        // Post date
        if let updatedAt = note.updatedAt?.value{
            dateLabel.text =  "\(note.getExactBoolValDefaultF(kHasEditCol) ? "Edited at " : "")\(updatedAt.formattedDate)"
        }
        
    }
}
