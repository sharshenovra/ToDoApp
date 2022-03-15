//
//  DetailViewModel.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 16/3/22.
//

import UIKit
import Foundation

protocol TasksShowDelegate: AnyObject{
    func fillNews(model: TaskModel)
}


class DetailViewModel{
    
    weak var delegate: TasksShowDelegate? = nil
    
    weak var selectDelegate: TaskSelectDelegate? = nil
    
    init(delegate: TasksShowDelegate){
        self.delegate = delegate
    }
    
}
