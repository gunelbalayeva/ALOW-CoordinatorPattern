//
//  UploadDocumentViewController.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import UIKit
class UploadDocumentViewController: UIViewController {
 
    private let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private let stepLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "3/3 mərhələ"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    private let langLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Azərbaycan ➝ Ərəb"
        lbl.font = .systemFont(ofSize: 28, weight: .black)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "11 AZN"
        lbl.font = .systemFont(ofSize: 24, weight: .heavy)
        lbl.textColor = UIColor(named: "green")
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let uploadIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "file")
        iv.tintColor = .gray
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let uploadInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sənədləri yüklə\nFormat: .jpeg, .png, .pdf"
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let uploadButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sənəd yüklə", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor(named: "buttonColor")
        btn.layer.cornerRadius = 12
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupLayout()
        setupActions()
    }
    
    
    private func setupViews() {
        [backButton, stepLabel, langLabel, priceLabel, uploadIcon, uploadInfoLabel, uploadButton]
            .forEach(view.addSubview(_:))
    }
    
    private func setupLayout() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(24)
        }
        
        stepLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.leading.equalTo(backButton.snp.trailing).offset(100)
        }
        
        langLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(32)
            make.trailing.lessThanOrEqualToSuperview().inset(32)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(langLabel.snp.bottom).offset(8)
            make.leading.equalTo(langLabel)
        }
        
        uploadIcon.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        uploadInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(uploadIcon.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(50)
        }
    }
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    
    
    @objc private func backTapped() {
        UploadDocumentViewController.coordinator?.goBack()
    }
}

