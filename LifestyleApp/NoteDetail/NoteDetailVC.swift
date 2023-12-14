//
//  NoteDetailVC.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import UIKit
import ImageSlideshow
import LeanCloud
import FaveButton
import GrowingTextView

class NoteDetailVC: UIViewController {
    
    let note: LCObject
    
    @IBOutlet weak var authorAvatarBtn: UIButton!
    @IBOutlet weak var authorNickNameBtn: UIButton!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var imageSlideShowHeight: NSLayoutConstraint!
    @IBOutlet weak var imageSlideshow: ImageSlideshow!
    @IBOutlet weak var tableHeaderView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var channelBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //下方bar(点赞收藏评论)
    @IBOutlet weak var likeBtn: FaveButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var favBtn: FaveButton!
    @IBOutlet weak var favCountLabel: UILabel!
    @IBOutlet weak var commentCountBtn: UIButton!
    
    @IBOutlet weak var textViewBarView: UIView!
    @IBOutlet weak var textView: GrowingTextView!
    @IBOutlet weak var textViewBarBottomConstraint: NSLayoutConstraint!
    
    // compute attribute
    var author: LCUser? { note.get(kAuthorCol) as? LCUser}
    
    init?(coder: NSCoder, note: LCObject) {
        self.note = note
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Need parameters, you cannot init this object only in storyboard")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        
        
        
        
        setUI()
    }
    
    // render subview to adapt if view changes
    //动态计算tableHeaderView的height(放在viewdidappear的话会触发多次),相当于手动实现了estimate size(目前cell已配备这种功能)
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustTableHeaderViewHeight()
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
}
