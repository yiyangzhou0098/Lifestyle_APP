//
//  NoteEditVC-Config.swift
//  LifestyleApp
//
//  Created by ZYY on 12/11/23.
//

import Foundation

extension NoteEditVC {
    
    func config() {
        hideKeyBoardWhenTapperAround()
        
        photoCollectionView.dragInteractionEnabled = true
        
        // Remove textfield insets spacing
        let lineFragmentPadding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -textView.textContainer.lineFragmentPadding, bottom: 0, right: -textView.textContainer.lineFragmentPadding)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let typingAttributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.secondaryLabel
        ]
        textView.typingAttributes = typingAttributes
        textView.tintColorDidChange()
        
        
    }
}
