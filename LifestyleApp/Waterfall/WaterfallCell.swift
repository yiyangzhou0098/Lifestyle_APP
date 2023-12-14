//
//  WaterfallCell.swift
//  LifestyleApp
//
//  Created by ZYY on 12/8/23.
//

import UIKit
import LeanCloud
import Kingfisher

class WaterfallCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var note: LCObject? {
        
        didSet {            
            guard let note = note, let author = note.get(kAuthorCol) as? LCUser else {
                return }
                
            let coverPhotoUrl = note.getImageURL(from: kCoverPhotoCol, .coverPhoto)
            imageView.kf.setImage(with: coverPhotoUrl, options: [.transition(.fade(0.2))])

            let avatarURL = author.getImageURL(from: kAvatarCol, .avatar)
            avatarImageView.kf.setImage(with: avatarURL)
            
            titileLabel.text = note.getExactStringVal(kTitleCol)
//            nickNameLabel.text = note.getExactStringVal(kNickNameCol)
            likeBtn.setTitle("\(note.getExactStringVal(kLikeCountCol))", for: .normal)
            
            // TODO: like, favorite 
        }
    }
}
