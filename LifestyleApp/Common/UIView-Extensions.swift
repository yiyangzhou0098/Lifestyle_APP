//
//  UIView-Extensions.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import Foundation

extension UITextField{
    var unwrappedText: String { text ?? "" }
    var exactText: String { unwrappedText.isBlank ? "" : unwrappedText }
    var isBlank: Bool { unwrappedText.isBlank }
}

extension UITextView{
    var unwrappedText: String { text ?? "" }
    var exactText: String { unwrappedText.isBlank ? "" : unwrappedText }
    var isBlank: Bool { unwrappedText.isBlank }
}

extension UIImage{

    convenience init?(_ data: Data?) {
        if let unwrappedData = data{
            self.init(data: unwrappedData)
        }else{
            return nil
        }
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data?{
        jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
