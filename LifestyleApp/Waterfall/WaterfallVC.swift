//
//  WaterfallVCCollectionViewController.swift
//  Pods
//
//  Created by ZYY on 12/8/23.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import LeanCloud
import XLPagerTabStrip
import SegementSlide
import MJRefresh

class WaterfallVC: UICollectionViewController, SegementSlideContentScrollViewDelegate {
    
    lazy var header = MJRefreshNormalHeader()
    @objc var scrollView: UIScrollView { collectionView }

    var channel = ""
    var notes: [LCObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        // Homepage:
        header.setRefreshingTarget(self, refreshingAction: #selector(getNotes))
        header.beginRefreshing()

        let layout = collectionView.collectionViewLayout as! CHTCollectionViewWaterfallLayout
        layout.columnCount = 2
        layout.minimumColumnSpacing = kWaterfallPadding
        layout.minimumInteritemSpacing = kWaterfallPadding
        layout.sectionInset = UIEdgeInsets(top: 0, left: kWaterfallPadding, bottom: kWaterfallPadding, right: kWaterfallPadding)
        
    }
    
}

// MARK: - CHT layout
extension WaterfallVC: CHTCollectionViewDelegateWaterfallLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // test photos
//        UIImage(named: "\(indexPath.item + 1)")!.size
        
        
        let cellW = (screenRect.width - kWaterfallPadding * 3) / 2
        var cellH: CGFloat = 0
        let note = notes[indexPath.item]
        let coverPhotoRatio = CGFloat(note.getExactDoubelVal(kCoverPhotoRatioCol))
        cellH = cellW * coverPhotoRatio + kWaterfallCellBottomViewH
        
        return CGSize(width: cellW, height: cellH)
    }
}

extension WaterfallVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel)
    }
}



