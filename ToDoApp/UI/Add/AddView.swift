//
//  AddView.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 15/3/22.
//

import Foundation
import SnapKit

class AddView: UIViewController{
    
    private lazy var backButton = CustomButton(title: "Back")
    private lazy var mainTitle = CustomUILabel(fontSize: 30, title: "Add Task")
    private lazy var taskTitle = CustomUILabel(fontSize: 20, title: "Task:")
    private lazy var taskField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemGray
        view.placeholder = "Enter task"
        view.delegate = self
        return view
    }()
    private lazy var dateTitle = CustomUILabel(fontSize: 20, title: "Date:")
    private lazy var dateField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemGray
        view.delegate = self
        return view
    }()
    private lazy var descriptionTitle = CustomUILabel(fontSize: 20, title: "Description:")
    private lazy var descriptionField: UITextView = {
        let view = UITextView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .dateAndTime
        view.minimumDate = Date()
        return view
    }()
    
    private lazy var completeButton = CustomButton(title: "Complete")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupConstraints()
        setupViews()
    }
    
    func setupViews(){
        backButton.setOnClickListener { view in
            self.navigationController?.popToRootViewController(animated: true)
        }
        completeButton.setOnClickListener { view in
            if self.taskField.text ?? "" != "" && self.descriptionField.text ?? "" != ""{
                let model = TaskModel.createNewsModel(taskTitle: self.taskField.text ?? "", taskDate: self.datePicker.date.formatted() , taskDescription: self.descriptionField.text ?? "")
                DataBase.shared.saveTask(model: model)
                self.navigationController?.popToRootViewController(animated: true)
            }else{
                let alert = UIAlertController(title: "Error", message: "Enter data correctly", preferredStyle: .alert)
               
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
    }
    
    func setupConstraints(){
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(view.safeArea.top)
        }
        
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        view.addSubview(taskTitle)
        taskTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        view.addSubview(taskField)
        taskField.snp.makeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(24)
        }
        
        view.addSubview(dateTitle)
        dateTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(16)
            make.left.equalTo(taskField.snp.right).offset(16)
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(dateField)
        dateField.snp.makeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom).offset(8)
            make.left.equalTo(taskField.snp.right).offset(8)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(24)
        }
        
        dateField.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(descriptionTitle)
        descriptionTitle.snp.makeConstraints { make in
            make.top.equalTo(taskField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        view.addSubview(descriptionField)
        descriptionField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(descriptionTitle.snp.bottom).offset(8)
            make.bottom.equalTo(view.safeArea.bottom).offset(-100)
        }
        
        view.addSubview(completeButton)
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionField.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeArea.bottom).offset(16)
            make.width.equalTo(view.frame.width / 3)
            make.centerX.equalToSuperview()
        }
        
    }
    
}

extension AddView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskField.resignFirstResponder()
        return true
    }
}