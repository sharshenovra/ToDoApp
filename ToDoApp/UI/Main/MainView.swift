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
    
    private lazy var taskTitle = CustomUILabel(fontSize: 30, title: "ToDo List")
    private lazy var addButton = CustomButton(title: "Add Task")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        setupConstraints()
        setupMainWindow()
        
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
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .darkGray
    }
    
    func setupConstraints(){
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.right.equalTo(view.safeArea.right).offset(-16)
        }
        
        view.addSubview(taskTitle)
        taskTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(taskTableView)
        taskTableView.snp.makeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom)
        }
    }
    
    
    
}

extension MainView: NewsCellDelegate {
    func onClick(model: TaskModel){
        viewModel.selectTask(model: model)
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
        taskTableView.fill(models: model)
    }
}
