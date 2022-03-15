//
//  MainViewModel.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import RealmSwift

protocol MainDelegate: AnyObject {
    func showTasks(model: Results<TaskModel>)
}

class MainViewModel {
    
    weak var delegate: MainDelegate? = nil
    
    weak var selectDelegate: TaskSelectDelegate? = nil
    
    weak var showDelegate: TasksShowDelegate? = nil
    
    init(delegate: MainDelegate) {
        self.delegate = delegate

    }
    func selectTask(model: TaskModel){
        selectDelegate?.selectTasks(model: model)
    }
    
    func getTasks() {
        self.delegate?.showTasks(model: DataBase.shared.getTasks()!)
}
    
}

