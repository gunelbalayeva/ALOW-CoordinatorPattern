//
//  HomeViewController.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
  
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.text = "Populyar təkliflər"
        label.font = .systemFont(ofSize: 28, weight: .black)
        label.textColor = .black
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private let servicesLabel: UILabel = {
        let label = UILabel()
        label.text = "Xidmətlər"
        label.font = .systemFont(ofSize: 28, weight: .black)
        label.textColor = .black
        return label
    }()
    
    private let lookLabel: UILabel = {
        let label = UILabel()
        label.text = "Hamsına bax"
        label.textColor = UIColor(named: "green")
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let servicesHeaderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let servicesTableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .singleLine
        return tv
    }()
    
    private let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sənin üçün"
        label.font = .systemFont(ofSize: 28, weight: .black)
        label.textColor = .black
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 140)
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(FlagsCell.self, forCellWithReuseIdentifier: FlagsCell.identifier)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupLayout()
        setupActions()
    }
    
    
    private func setupViews() {
        view.addSubview(popularLabel)
        view.addSubview(stackView)
        view.addSubview(servicesHeaderStack)
        view.addSubview(servicesTableView)
        view.addSubview(sectionTitleLabel)
        view.addSubview(collectionView)
        
        servicesHeaderStack.addArrangedSubview(servicesLabel)
        servicesHeaderStack.addArrangedSubview(lookLabel)
        servicesTableView.register(DocumentPriceCell.self, forCellReuseIdentifier: DocumentPriceCell.identifier)
        servicesTableView.dataSource = self
        servicesTableView.delegate = self
        
        let travelView = createOfferView(iconName: "airplane", title: "Səyahət sənədləri", subtitle: "AZ → EN")
        travelView.tag = 1
        stackView.addArrangedSubview(travelView)
        
        let educationView = createOfferView(iconName: "education", title: "Təhsil sənədləri", subtitle: "EN → RU")
        educationView.tag = 2
        stackView.addArrangedSubview(educationView)
    }
    
    private func setupLayout() {
        popularLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalToSuperview().offset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(popularLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(130)
        }
        
        servicesHeaderStack.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        servicesTableView.snp.makeConstraints { make in
            make.top.equalTo(servicesHeaderStack.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(220)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(servicesTableView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
            make.height.equalTo(140)
        }
    }
    
    private func setupActions() {
        for subview in stackView.arrangedSubviews {
            subview.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToNext(_:)))
            subview.addGestureRecognizer(tap)
        }
    }
    
    private func createOfferView(iconName: String, title: String, subtitle :String) -> UIView {
        let container = UIView()
        container.backgroundColor = UIColor.systemGray6
        container.layer.cornerRadius = 12
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: iconName)
        iconImageView.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .light)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        
        container.addSubview(iconImageView)
        container.addSubview(titleLabel)
        container.addSubview(subtitleLabel)

        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        return container
    }
    
    @objc
    private func navigateToNext(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        HomeViewController.coordinator?.goToUpload()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DocumentPriceCell.identifier, for: indexPath) as? DocumentPriceCell else {
            return UITableViewCell()
        }
        
        let titles = ["Pasport", "Şəxsiyyət vəsiqəsi", "Sürücülük vəsiqəsi", "Pensiya vəsiqəsi"]
        let prices = ["10-30 AZN", "5-15 AZN", "8-25 AZN", "6-20 AZN"]
        
        cell.titleLabel.text = titles[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HomeViewController.coordinator?.goToLanguageSelection()
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagsCell.identifier, for: indexPath) as? FlagsCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item == 0 {
            cell.configure(flag1: "az", flag2: "tr", title:"Şəxsiyyət vəsiqəsi")
        } else if indexPath.item == 1 {
            cell.configure(flag1: "az", flag2: "arabian", title: "Arayış" )
        } else if indexPath.item == 2 {
            cell.configure(flag1: "Group", flag2: "az", title: "Pensiya vəsiqəsi " )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HomeViewController.coordinator?.goToLanguageSelection()
    }
}
