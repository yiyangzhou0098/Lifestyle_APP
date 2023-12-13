//
//  NoteEditVC-Note.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import LeanCloud

extension NoteEditVC {
    func createNote() {
        do {
            let noteGroup = DispatchGroup()
            let note = LCObject(className: kNoteTable)
            
            if let videoURL = self.videoURL {
                let video = LCFile(payload: .fileURL(fileURL: videoURL))
                video.save(to: note, as: kVideoCol, group: noteGroup)
            }
            
            if let coverPhotoData = photos[0].jpeg(.high){
                let coverPhoto = LCFile(payload: .data(data: coverPhotoData))
//                coverPhoto.mimeType = "image/jpeg"
                coverPhoto.save(to: note, as: kCoverPhotoCol, group: noteGroup)
            }
            
            let photoGroup = DispatchGroup()
            var photoPath: [Int: String] = [:]
            
            // Get dictionary of photos, key is index
            for (index, eachPhoto) in photos.enumerated() {
                if let eachPhotoData = eachPhoto.pngData() {
                    let photo = LCFile(payload: .data(data: eachPhotoData))
                    photoGroup.enter()
                    photo.save {
                        res in
                        if case .success = res, let path = photo.url?.stringValue {
                            photoPath[index] = path
                        }
                        photoGroup.leave()
                    }
                }
            }
            
            // Sort photos
            noteGroup.enter()
            photoGroup.notify(queue: .main) {
                let photoPathsArr = photoPath.sorted(by: <).map{ $0.value }
                
                do {
                    try note.set(kPhotosCol, value: photoPathsArr)
                    note.save{ _ in
                        print("Save successful")
                        noteGroup.leave()
                    }
                } catch {
                    print("Save failed")
                }
            }
            
            
            try note.set(kTitleCol, value: titleTextField.exactText)
            try note.set(kTextCol, value: textView.exactText)
            try note.set(kChannelCol, value: channel.isEmpty ? "Recommand" : channel)
            try note.set(kSubChannelCol, value: subChannel)
            
            noteGroup.enter()
            note.save{
                _ in noteGroup.leave()
            }
            
            noteGroup.notify(queue: .main) {
                print("All notes have been saved")
            }
        } catch {
            print("Error")
        }
    }
}
