//
//  WaterfallVC-DataSource.swift
//  LifestyleApp
//
//  Created by ZYY on 12/13/23.
//

import Foundation
import XLPagerTabStrip

extension WaterfallVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return notes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterfallCellID, for: indexPath) as! WaterfallCell
        
        cell.note = notes[indexPath.item]
        return cell
    }
}

