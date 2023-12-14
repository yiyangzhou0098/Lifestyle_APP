//
//  Basic-Extensions.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import UIKit
import AVFoundation
import DateToolsSwift

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

extension Date{
    //5 format of date:
    //1.Just now 5 mins ago;2.Today 21:10;3.Yesterday 21:10;4.09-15;5.2019-09-15
    var formattedDate: String{
        let currentYear = Date().year
        if year == currentYear{
            if isToday{
                if minutesAgo > 10{//note posted more than 10 mins
                    return "Today \(format(with: "HH:mm"))"
                }else{
                    return timeAgoSinceNow
                }
            }else if isYesterday{//Yesterday
                return "Yesterday \(format(with: "HH:mm"))"
            }else{//the  day before yesterday
                return format(with: "MM-dd")
            }
        }else if year < currentYear{//last year or older
            return format(with: "yyyy-MM-dd")
        }else{
            return "Not use"
        }
    }
}
