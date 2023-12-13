//
//  NoteEditVC-Helper.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import UIKit

extension NoteEditVC{
    func isValidateNote() -> Bool{
        
        guard !photos.isEmpty else {
            showTextHUD("At least select 1 photo")
            return false
        }
        
        guard textView.text.count <= kMaxNoteTextCount else {
            showTextHUD("Note can only be less than \(kMaxNoteTextCount)")
            return false
        }
        return true
    }
    
    func handleTFEditChanged(){
        // when text highlight return
        guard titleTextField.markedTextRange == nil else { return }
        
        if titleTextField.unwrappedText.count > kMaxNoteTitleCount{
            
            titleTextField.text = String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            
            showTextHUD("Title can only be less than\(kMaxNoteTitleCount)")
            
            DispatchQueue.main.async {
                let end = self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end)
            }
        }
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    
    
//    func showAllowPushAlert(){
//        UNUserNotificationCenter.current().getNotificationSettings { settings in
//            switch settings.authorizationStatus{
//            //未请求过授权(notDetermined)需再次请求授权,此处省略
//
//            //未授权(不允许通知)时引导用户去设置App里授权
//            case .denied:
//                DispatchQueue.main.async {
//                    let alert = UIAlertController(title: #""小粉书"想给您发送通知"#, message: "收到评论后第一时间就知道哦~", preferredStyle: .alert)
//                    let notAllowAction = UIAlertAction(title: "不允许", style: .cancel)
//                    let allowAction = UIAlertAction(title: "允许", style: .default) { _ in
//                        jumpToSetting()
//                    }
//                    alert.addAction(notAllowAction)
//                    alert.addAction(allowAction)
//                    self.view.window?.rootViewController?.present(alert, animated: true)
//                }
//            default:
//                break
//            }
//        }
//    }
}
