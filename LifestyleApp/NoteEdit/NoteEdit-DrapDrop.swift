//
//  NoteEdit-DrapDrop.swift
//  LifestyleApp
//
//  Created by ZYY on 12/10/23.
//

import Foundation

extension NoteEditVC: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        let photo = photos[indexPath.item]
        let drapItem = UIDragItem(itemProvider: NSItemProvider(object: photos[indexPath.item]))
        drapItem.localObject = photo
        
        return [drapItem]
    }
}

extension NoteEditVC: UICollectionViewDropDelegate {
    
    // In session
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
        
    }
    
    // End session
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        if coordinator.proposal.operation == .move,
            let item = coordinator.items.first,
            let sourceIndexPath = item.sourceIndexPath,
            let destinationIndexPath = coordinator.destinationIndexPath {
            
            // Batch update
            collectionView.performBatchUpdates {
                photos.remove(at: sourceIndexPath.item)
                photos.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
            }
            
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
    
}
