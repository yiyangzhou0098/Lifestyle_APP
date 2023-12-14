//
//  NoteDetailVC-Config.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import ImageSlideshow
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
