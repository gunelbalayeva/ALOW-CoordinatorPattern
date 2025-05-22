//
//  LanguageSelectionViewController.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import Foundation
import UIKit
import SnapKit

class LanguageSelectionViewController: UIViewController {
    private let stepLabel: UILabel = {
            let label = UILabel()
            label.text = "1/3 mərhələ"
            label.font = .systemFont(ofSize: 16)
            label.textColor = .darkGray
            return label
        }()
        
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Sənəd hansı dildədir?"
            label.font = UIFont.systemFont(ofSize: 28, weight: .black)
            label.textColor = .black
            label.numberOfLines = 0
            label.textAlignment = .left
            return label
        }()
        
        private let tableView = UITableView()
        
        private let backButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.tintColor = .black
            return button
        }()
        
        let countries = [
            ("Azərbaycanca", "az"),
            ("Rusça", "ru"),
            ("İngiliscə", "en"),
            ("Türkcə", "tr"),
            ("Ərəbcə", "arabian"),
            ("Yaponca", "jap"),
            ("Çincə", "china")
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            setupActions()
            
            navigationItem.hidesBackButton = true
        }
        
        private func setupUI() {
            view.backgroundColor = .white
            
            view.addSubview(backButton)
            view.addSubview(stepLabel)
            view.addSubview(titleLabel)
            view.addSubview(tableView)
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
                make.leading.equalToSuperview().offset(16)
                make.width.height.equalTo(24)
            }
            
            stepLabel.snp.makeConstraints { make in
                make.centerY.equalTo(backButton)
                make.leading.equalTo(backButton.snp.trailing).offset(100)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(backButton.snp.bottom).offset(20)
                make.leading.trailing.equalToSuperview().inset(16)
            }
            
            tableView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.leading.trailing.bottom.equalToSuperview()
            }
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
            tableView.separatorStyle = .none
        }
        
        private func setupActions() {
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        }
        
        @objc private func backButtonTapped() {
            LanguageSelectionViewController.coordinator?.goBack()
        }
    }

    extension LanguageSelectionViewController: UITableViewDelegate, UITableViewDataSource {
        
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
            LanguageSelectionViewController.coordinator?.goToUploadFromForYou()
        }}

