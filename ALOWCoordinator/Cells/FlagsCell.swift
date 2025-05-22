//
//  FlagsCell.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import UIKit
class FlagsCell: UICollectionViewCell {
    let containerView = UIView()
    let flag1 = UIImageView()
    let arrow = UIImageView()
    let flag2 = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(containerView)
        containerView.layer.cornerRadius = 24
        containerView.backgroundColor = UIColor(named: "viewBg")
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        [flag1, arrow, flag2].forEach { containerView.addSubview($0) }
        containerView.addSubview(titleLabel)
        
        flag1.image = UIImage(named: "az")
        flag2.image = UIImage(named: "tr")
        arrow.image = UIImage(systemName: "arrow.right")
        
        flag1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(32)
        }
        
        arrow.snp.makeConstraints { make in
            make.centerY.equalTo(flag1.snp.centerY)
            make.left.equalTo(flag1.snp.right).offset(8)
            make.width.equalTo(16)
        }
        
        flag2.snp.makeConstraints { make in
            make.centerY.equalTo(flag1.snp.centerY)
            make.left.equalTo(arrow.snp.right).offset(8)
            make.width.height.equalTo(32)
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.text = "Şəxsiyyət vəsiqəsi"
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(flag1.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
    }
    func configure(flag1: String, flag2: String, title: String) {
        self.flag1.image = UIImage(named: flag1)
        self.flag2.image = UIImage(named: flag2)
        self.titleLabel.text = title
    }
}
