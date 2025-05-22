//
//  CountryCell.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import UIKit

class CountryCell: UITableViewCell {
    
    let flagImageView = UIImageView()
    let nameLabel = UILabel()
    let arrowImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(flagImageView)
        flagImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }

        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(flagImageView.snp.trailing).offset(12)
        }
        
        arrowImageView.image = UIImage(systemName: "chevron.right")
        arrowImageView.tintColor = .gray
        contentView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(16)
        }
    }
    
    func configure(name: String, flagImageName: String) {
        nameLabel.text = name
        flagImageView.image = UIImage(named: flagImageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

