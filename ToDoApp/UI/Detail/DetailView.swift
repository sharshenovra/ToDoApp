//
//  DetailView.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 16/3/22.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class DetailView: UIViewController {

    private lazy var taskTitle = CustomUILabel(fontSize: 20, title: "")
    private lazy var taskDescription = CustomUILabel(fontSize: 20, title: "")
    private lazy var taskDate = CustomUILabel(fontSize: 20, title: "")
    private lazy var viewModel: DetailViewModel = {
        return DetailViewModel(delegate: self)
    }()
    
    public static func newIntanse(delegate: TaskSelectDelegate) -> DetailView{
        let controller = DetailView()
        controller.viewModel.selectDelegate = delegate
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainWindow()
        setupViews()

        setupConstraints()
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .darkGray
    }
    
    private func setupViews() {
        
    }
    
    private func setupConstraints(){
        view.addSubview(taskTitle)
        taskTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(taskDate)
        taskDate.snp.makeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            
        }
        
        view.addSubview(taskDescription)
        taskDescription.snp.makeConstraints { make in
            make.top.equalTo(taskDate.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
}

extension DetailView: TasksShowDelegate{
    func fillNews(model: TaskModel){
        taskTitle.setText(text: model.taskTitle)
        taskDescription.setText(text: model.taskDescription)
        taskDate.setText(text: model.taskDate)
    }
}
