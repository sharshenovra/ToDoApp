//
//  CustomLabel.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import UIKit

class CustomUILabel: UILabel{
    
    init(color: UIColor, fontSize: CGFloat, alignment: NSTextAlignment) {
        super.init(frame: .zero)

        textColor = color
        textAlignment = alignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        numberOfLines = 1
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 3)
        adjustsFontSizeToFitWidth = true
        numberOfLines = 1
    }
    
    init(fontSize: CGFloat, alignment: NSTextAlignment) {
        super.init(frame: .zero)

        textAlignment = alignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        numberOfLines = 1
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 3)
        adjustsFontSizeToFitWidth = true
        numberOfLines = 1
    }
    
    init(fontSize: CGFloat, title: String, alignment: NSTextAlignment) {
        super.init(frame: .zero)

        text = title
        textAlignment = alignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        numberOfLines = 1
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 3)
        adjustsFontSizeToFitWidth = true
        numberOfLines = 1
    }
    
    init(fontSize: CGFloat, title: String) {
        super.init(frame: .zero)

        text = title
        font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        numberOfLines = 1
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 3)
        adjustsFontSizeToFitWidth = true
        numberOfLines = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        self.text = text
    }
    
}
