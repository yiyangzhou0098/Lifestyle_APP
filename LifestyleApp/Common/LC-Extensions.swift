//
//  LC-Extensions.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import LeanCloud

extension LCFile{
    // Save files into attributes
    func save(to table: LCObject, as record: String, group: DispatchGroup? = nil){
        group?.enter()
        self.save { result in
            switch result {
            case .success:
                if let _ = self.objectId?.value {
                    do {
                        try table.set(record, value: self)
                        group?.enter()
                        table.save { (result) in
                            switch result {
                            case .success:
                                break
                            case .failure(error: let error):
                                print("Svave to table failed: \(error)")
                            }
                            group?.leave()
                        }
                    } catch {
                        print("Save to User failed: \(error)")
                    }
                }
            case .failure(error: let error):
                print("Save files failed: \(error)")
            }
            group?.leave()
        }
    }
}

extension LCObject{
    func getExactStringVal(_ col: String) -> String { get(col)?.stringValue ?? "" }
    func getExactIntVal(_ col: String) -> Int { get(col)?.intValue ?? 0 }
    func getExactDoubelVal(_ col: String) -> Double { get(col)?.doubleValue ?? 1 }// For most situations
    func getExactBoolValDefaultF(_ col: String) -> Bool { get(col)?.boolValue ?? false }// Return false when search nothing
    func getExactBoolValDefaultT(_ col: String) -> Bool { get(col)?.boolValue ?? true }// Return true
    
    enum imageType {
        case avatar
        case coverPhoto
    }
    
    // Get image from remote and transfer to url
    func getImageURL(from col: String, _ type: imageType) -> URL{
        if let file = get(col) as? LCFile, let path = file.url?.stringValue, let url = URL(string: path) {
            return url
        }else{
                    
            switch type{
            case .avatar:
                return Bundle.main.url(forResource: "avatarPH", withExtension: "jpeg")!
            case .coverPhoto:
                return Bundle.main.url(forResource: "imagePH", withExtension: "png")!
            }
        }
    }
    // add one for userinfo
    static func userInfo(where userObjectId: String, increase col: String){
        let query = LCQuery(className: kUserInfoTable)
        query.whereKey(kUserObjectIdCol, .equalTo(userObjectId))
        query.getFirst { res in
            if case let .success(object: userInfo) = res{
                try? userInfo.increase(col)
                userInfo.save{ _ in }
            }
        }
    }
    // set attribute in userinfo
    static func userInfo(where userObjectId: String, decrease col: String, to: Int){
        let query = LCQuery(className: kUserInfoTable)
        query.whereKey(kUserObjectIdCol, .equalTo(userObjectId))
        query.getFirst { res in
            if case let .success(object: userInfo) = res{
                try? userInfo.set(col, value: to)
                userInfo.save{ _ in }
            }
        }
    }
}

