//
//  TaskTableView.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift
import SwiftUI

protocol NewsCellDelegate: AnyObject{
    func onClick(model: TaskModel)
}

class TaskTableView: UIView{

    private lazy var taskTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .darkGray
        view.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: NewsCellDelegate? = nil
    
    override func layoutSubviews() {
        addSubview(taskTableView)
        taskTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private var models: Results<TaskModel>? = nil
    
    func fill(models: Results<TaskModel>) {
        self.models = models
        
        taskTableView.reloadData()
    }
    
    func reload(){
        taskTableView.reloadData()
    }
}

extension TaskTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = models?[indexPath.row]{
            delegate?.onClick(model: model)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        
        if let model = models?[indexPath.row] {
            cell.fill(model: model, number: indexPath.row + 1)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
