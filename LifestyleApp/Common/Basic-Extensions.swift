//
//  Basic-Extensions.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import UIKit
import AVFoundation

extension String{
    var isBlank: Bool{ self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    
    static func randomString(_ length: Int) -> String{
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func spliceAttrStr(_ dateStr: String) -> NSMutableAttributedString{
        let attrText = toAttrStr()
        let attrDate = " \(dateStr)".toAttrStr(12, .secondaryLabel)
        
        attrText.append(attrDate)
        
        return attrText
    }

    func toAttrStr(_ fontSize: CGFloat = 14, _ color: UIColor = .label) -> NSMutableAttributedString{
        let attr: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
            .foregroundColor: color
        ]
        return NSMutableAttributedString(string: self, attributes: attr)
    }
    
}

extension URL{
    // Generate thumbnail from video
    var thumbnail: UIImage{
        let asset = AVAsset(url: self)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        //如果视频尺寸确定的话可以用下面这句提高处理性能
        //assetImgGenerate.maximumSize = CGSize(width,height)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
            return imagePH
        }
    }
}
