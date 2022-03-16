//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import UIKit
import SnapKit

class TaskCell: UITableViewCell {
    
    lazy var taskLabel = CustomUILabel(fontSize: 20, alignment: .center)
    
    lazy var taskDateLabel = CustomUILabel(fontSize: 15, alignment: .center)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TaskCell")
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        accessoryType = isSelected ? .checkmark : .none
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        addSubview(taskLabel)
        taskLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }

        addSubview(taskDateLabel)
        taskDateLabel.snp.makeConstraints { make in
            make.top.equalTo(taskLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }

    func fill(model: TaskModel, number: Int) {
        taskLabel.text = "#\(number) - \(model.taskTitle)"
        taskDateLabel.text = model.taskDate
    }
}
