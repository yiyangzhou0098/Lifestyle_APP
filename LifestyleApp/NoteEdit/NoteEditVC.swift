//
//  NoteEditVC.swift
//  LifestyleApp
//
//  Created by ZYY on 12/9/23.
//

import Foundation
import UIKit


class NoteEditVC: UIViewController {
    
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelPlaceholderLabel: UILabel!
    
    var photos = [UIImage]()
    var videoURL: URL?
    
    var channel = ""
    var subChannel = ""
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoCount: Int{ photos.count }
    var isVideo: Bool{ videoURL != nil}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    // MARK: - Textfield
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEndOnExit(_ sender: Any) {
    }
    
    
    @IBAction func TFEditChanged(_ sender: Any) {
        titleCountLabel.text = String(100 - titleTextField.unwrappedText.count)
    }
    
    // MARK: Post
    
    @IBAction func saveDraftNote(_ sender: Any) {
    }
    
    
    @IBAction func postNote(_ sender: Any) {
        guard isValidateNote() else { return }
        
        createNote()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let channelVC = segue.destination as? ChannelVC {
            channelVC.PVDelegate = self
        }
    }
}

extension NoteEditVC: ChannelVCDelegate {
    func updateChannel(channel: String, subChannel: String) {
        // data passing
        self.channel = channel
        self.subChannel = subChannel
        
        // UI animated
        channelLabel.text = subChannel
        channelIcon.tintColor = blueColor
        channelLabel.textColor = blueColor
        channelPlaceholderLabel.isHidden = true
     }
}

extension NoteEditVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // MARK: ensure textfield text (regular input/paste input) will not be longer than 100 chars
        let isExceed = range.location >= 100 || (string.count + textField.unwrappedText.count) > 100
        if isExceed {
            showTextHUD("Exceed maximum characters")
        }
        return !isExceed
    }
}
