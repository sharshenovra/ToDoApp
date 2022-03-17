//
//  SettingsView.swift
//  ToDoApp
//
//  Created by Ruslan Sharshenov on 17/3/22.
//

import Foundation
import UIKit
import SnapKit

class SettingsView: UIViewController {
    
    private lazy var languagesTableView = UITableView()
    
    private lazy var languagesTitle = CustomUILabel(fontSize: 20, alignment: .center, title: "Choose language".localized())
    
    private lazy var backButton = CustomButton(nameImage: "chevron.left", color: .systemBlue)
    
    private lazy var languages: [String] = ["English".localized(), "Russian".localized()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupView()
        languagesTableView.delegate = self
        languagesTableView.dataSource = self
        view.backgroundColor = .systemBackground
    }
    
    func setupConstraints(){
        
        view.addSubview(languagesTitle)
        languagesTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeArea.top)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(view.safeArea.top)
            make.centerY.equalTo(languagesTitle)
            make.height.width.equalTo(24)
        }
        
        view.addSubview(languagesTableView)
        languagesTableView.snp.makeConstraints { make in
            make.top.equalTo(languagesTitle.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupView(){
        backButton.setOnClickListener { view in
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if languages[indexPath.row] == "English".localized(){
            UserDefaults.standard.set("en",forKey: "language")
        }else{
            UserDefaults.standard.set("ru",forKey: "language")
        }
        Bundle.setLanguage(lang: "\(UserDefaults.standard.string(forKey: "language") ?? "ru")")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = languages[indexPath.row].localized()
        return cell
    }
    
    
}
