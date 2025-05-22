//
//  DocumentPriceCell.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import Foundation
import UIKit
import SnapKit

class DocumentPriceCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let priceLabel = PaddedLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI(){
        titleLabel.font = .systemFont(ofSize: 16)
        priceLabel.font = .systemFont(ofSize: 14)
        priceLabel.textColor = .black
        priceLabel.backgroundColor = UIColor(named: "priceBg")
//        priceLabel.layer.borderWidth = 1
        priceLabel.layer.cornerRadius = 8
        priceLabel.clipsToBounds = true
        priceLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}
