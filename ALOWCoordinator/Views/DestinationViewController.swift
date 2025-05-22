//
//  DestinationViewController.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//


import Foundation
import UIKit
import SnapKit

class DestinationViewController: UIViewController {
    private let stepLabel = UILabel()
    
    let countries = [
        ("Azərbaycanca", "az"),
        ("Rusça", "ru"),
        ("İngiliscə", "en"),
        ("Türkcə", "tr"),
        ("Ərəbcə", "arabian"),
        ("Yaponca", "jap"),
        ("Çincə", "china")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        stepLabel.text = "2/3 mərhələ"
        stepLabel.font = .systemFont(ofSize: 16)
        stepLabel.textColor = .darkGray
        view.addSubview(stepLabel)
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(24)
        }
        
        stepLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.leading.equalTo(backButton.snp.trailing).offset(100)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "Sənəd hansı dilə tərcümə olunacaq?"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .black)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.separatorStyle = .none
    }
    
    @objc func backButtonTapped() {
        LanguageSelectionViewController.coordinator?.goBack()
    }
}

extension DestinationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        let country = countries[indexPath.row]
        cell.configure(name: country.0, flagImageName: country.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UploadDocumentViewController.coordinator?.goToUpload()
    }
}

