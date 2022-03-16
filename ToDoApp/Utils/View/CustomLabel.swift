//
//  CustomLabel.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import UIKit

class CustomUILabel: UILabel{
    
    init(fontSize: CGFloat, alignment: NSTextAlignment, title: String) {
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
    
   convenience init(fontSize: CGFloat, alignment: NSTextAlignment) {
       self.init(fontSize: fontSize, alignment: alignment, title: "")
    }
    
    convenience init(fontSize: CGFloat, title: String, alignment: NSTextAlignment) {
        self.init(fontSize: fontSize, alignment: alignment, title: title)
    }
    
   convenience init(fontSize: CGFloat, title: String) {
       self.init(fontSize: fontSize, alignment: .left, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        self.text = text
    }
    
}
