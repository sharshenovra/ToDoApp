//
//  CustomButton.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import UIKit

class CustomButton: UIButton {

    private var onClick: (CustomButton) -> Void = { _ in }
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.blue, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    init(nameImage: String, color: UIColor) {
        super.init(frame: .zero)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        setImage(UIImage(systemName: "\(nameImage)"), for: .normal)
        tintColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOnClickListener(onClick: @escaping (CustomButton) -> Void) {
        self.onClick = onClick
        
        addTarget(nil, action: #selector(clickButton(view:)), for: .touchUpInside)
    }
    
    @objc func clickButton(view: UIButton) {
        onClick(self)
    }
}


