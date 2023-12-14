//
//  NoteDetailVC-Config.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import ImageSlideshow
import GrowingTextView
import LeanCloud

extension NoteDetailVC{
    func config(){
        
        //imageSlideshow
        imageSlideshow.zoomEnabled = true
        imageSlideshow.circular = false
        imageSlideshow.contentScaleMode = .scaleAspectFill
        imageSlideshow.activityIndicator = DefaultActivityIndicator()
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = mainColor
        imageSlideshow.pageIndicator = pageControl
        
        // textVIew (GrowingTextView height 33 will be vertical center. Now is 40 so up and down add 3.5 and add 8
        textView.textContainerInset = UIEdgeInsets(top: 11.5, left: 16, bottom: 11.5, right: 16)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func adjustTableHeaderViewHeight(){
        //计算出tableHeaderView里内容的总height--固定用法(开销较大,不可过度使用)
        let height = tableHeaderView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        //取出初始frame值,待会把里面的height替换成上面计算的height,其余不替换
        var frame = tableHeaderView.frame
        //一旦tableHeaderView的height已经是实际height了,则不能也没必要继续赋值frame了.
        //需判断,否则更改tableHeaderView的frame会再次触发viewDidLayoutSubviews,进而进入死循环
        if frame.height != height{
            frame.size.height = height//替换成实际height
            tableHeaderView.frame = frame//重新赋值frame,即可改变tableHeaderView的布局(实际就是改变height)
        }
    }
}

// Listener
extension NoteDetailVC{
    @objc private func keyboardWillChangeFrame(_ notification: Notification){
        if let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            // Keyboard current height
            // screen hight - keyboard helght
            let keyboardH = screenRect.height - endFrame.origin.y
            
            if keyboardH > 0{
//                view.insertSubview(overlayView, belowSubview: textViewBarView)//Add a black transparent mask
            }else{
//                overlayView.removeFromSuperview()//Remove black transparent mask
                textViewBarView.isHidden = true
            }
            
            textViewBarBottomConstraint.constant = -keyboardH
            // refresh view when constraint change
            view.layoutIfNeeded()
        }
    }
}
