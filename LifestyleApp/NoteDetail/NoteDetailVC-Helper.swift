//
//  NoteDetailVC-Helper.swift
//  LifestyleApp
//
//  Created by ZYY on 12/14/23.
//

import Foundation
import LeanCloud

extension NoteDetailVC{
    func comment(){
        if let _ = LCApplication.default.currentUser{
            showTextView()
        }else{
            showTextHUD("You need to Login")
//            showLoginHUD()
        }
    }
    
    //textView,use to comment and reply
    func showTextView(_ isReply: Bool = false, _ textViewPH: String = kNoteCommentPH, _ replyToUser: LCUser? = nil){
        //reset
        self.isReply = isReply
        textView.placeholder = textViewPH
        self.replyToUser = replyToUser
        
        //UI
        textView.becomeFirstResponder()
        textViewBarView.isHidden = false
    }
}
