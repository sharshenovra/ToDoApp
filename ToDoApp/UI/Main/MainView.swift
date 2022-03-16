//
//  MainView.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

protocol TaskSelectDelegate: AnyObject{
    func selectTasks(model: TaskModel)
}

class MainView: UIViewController{
    
    
    private lazy var taskTableView = TaskTableView()
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel(delegate: self)
    }()
    
    private lazy var taskTitle = CustomUILabel(fontSize: 30, title: "ToDo List", alignment: .center)
    private lazy var addButton = CustomButton(nameImage: "plus", color: .blue)
    private lazy var deleteButton = CustomButton(nameImage: "trash", color: .blue)
    private lazy var noTitle = CustomUILabel(fontSize: 20, title: "Nothing to view", alignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        setupConstraints()
        
        viewModel.getTasks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getTasks()
    }
    
    private func setupViews(){
        taskTableView.delegate = self
        
        addButton.setOnClickListener { view in
            self.navigationController?.pushViewController(AddView(), animated: true)
        }
        deleteButton.setOnClickListener { view in
            DataBase.shared.deleteAllHistory()
            self.viewModel.getTasks()
        }
    }
  
    func setupConstraints(){
        
        view.addSubview(taskTitle)
        taskTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.right.equalTo(view.safeArea.right).offset(-16)
            make.centerY.equalTo(taskTitle)
            make.height.width.equalTo(24)
        }
        
        view.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.right.equalTo(addButton.snp.left).offset(-16)
            make.centerY.equalTo(taskTitle)
            make.height.width.equalTo(24)
        }
        
    }
    
    func addTableView(){
        view.addSubview(taskTableView)
        taskTableView.snp.makeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom)
        }
    }
    
    func addNoLabel(){
        view.addSubview(noTitle)
        noTitle.snp.makeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    
    
}

extension MainView: NewsCellDelegate {
    func onClick(model: TaskModel){
        let vc = DetailView.newIntanse(delegate: self)
        vc.fillNews(model: model)
        present(vc, animated: true)
    }
}

extension MainView: TaskSelectDelegate{
    func selectTasks(model: TaskModel) {
        viewModel.selectTask(model: model)
    }
}

extension MainView: MainDelegate {
    func showTasks(model: Results<TaskModel>) {
        if model.count >= 1{
            addTableView()
            taskTableView.fill(models: model)
            noTitle.removeFromSuperview()
        }else{
            taskTableView.removeFromSuperview()
            addNoLabel()
        }
    }
}
