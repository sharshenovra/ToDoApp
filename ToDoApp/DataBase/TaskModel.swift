//
//  TaskModel.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import RealmSwift

class TaskModel: Object {
    @objc dynamic var taskTitle = ""
    @objc dynamic var taskDate = ""
    @objc dynamic var taskDescription = ""
    
    static func createNewsModel(taskTitle: String, taskDate: String, taskDescription: String) -> TaskModel {
        let model = TaskModel()
        model.taskTitle = taskTitle
        model.taskDate = taskDate
        model.taskDescription = taskDescription
        return model
    }
}
