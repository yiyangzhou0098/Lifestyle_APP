//
//  CustomViews.swift
//  LifestyleApp
//
//  Created by ZYY on 12/13/23.
//

import Foundation

@IBDesignable
class BigButton: UIButton{
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    //用代码创建这个btn时走这里,最好加上,以后用代码也能创建这样的button
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        sharedInit()
    }
    
    private func sharedInit(){
        backgroundColor = .secondarySystemBackground
        tintColor = .placeholderText
        setTitleColor(.placeholderText, for: .normal)
        
        contentHorizontalAlignment = .leading
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
}
