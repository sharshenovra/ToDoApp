//
//  DataBase.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import RealmSwift

class DataBase {
    
    public static let shared = DataBase()
    
    private lazy var realm: Realm? = {
        do {
            return try Realm()
        } catch {
            return nil
        }
    }()
    
    func saveTask(model: TaskModel) {
        do {
            try realm?.write{
                realm?.add(model)
            }
        } catch {
            print("Can't save to history")
        }
    }
    
    func getTasks() -> Results<TaskModel>? {
        return realm?.objects(TaskModel.self)
    }
    
    func deleteItem(model: TaskModel){
        do {
            try realm?.write{
                realm?.delete(getTasks()!.filter("taskTitle CONTAINS '\(model.taskTitle)'"))
            }
        } catch {
            print("Can't delete from database")
        }
    }
    
    func deleteAllHistory() {
        do {
            try realm?.write{
                realm?.deleteAll()
            }
        } catch {
            print("Can't delete all History")
        }
    }
}
