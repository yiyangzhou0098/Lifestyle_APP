//
//  WaterfallVC-Delegate.swift
//  LifestyleApp
//
//  Created by ZYY on 12/13/23.
//

import Foundation

extension WaterfallVC {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // dependency injection
        let detailVC = storyboard!.instantiateViewController(identifier: kNoteDetailVCID) { coder in
            NoteDetailVC(coder: coder, note: self.notes[indexPath.item])
            }
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
        
     }
}
                                                        
