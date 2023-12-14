//
//  WaterfallVC-LoadData.swift
//  LifestyleApp
//
//  Created by ZYY on 12/13/23.
//

import Foundation
import LeanCloud

extension WaterfallVC {
    
    // Get all Notes from cloud
    @objc func getNotes(){
        let query = LCQuery(className: kNoteTable)
        
        
        query.whereKey(kChannelCol, .equalTo(channel))// Condition query
        query.whereKey(kAuthorCol, .included)// author query
        query.whereKey(kUpdatedAtCol, .descending)//sort
        query.limit = kNotesOffset// paging
        
        query.find { result in
            if case let .success(objects: notes) = result{
                self.notes = notes
                print(notes)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            DispatchQueue.main.async {
                self.header.endRefreshing()
            }
        }
    }
}
