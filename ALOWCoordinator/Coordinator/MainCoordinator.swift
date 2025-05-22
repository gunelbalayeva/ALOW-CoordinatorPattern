//
//  MainCoordinator.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

final class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let home = HomeViewController()
        HomeViewController.coordinator = self
        navigationController.pushViewController(home, animated: false)
    }
    
    func goToUpload() {
        let upload = UploadDocumentViewController()
        navigationController.pushViewController(upload, animated: true)
    }
    
    func goToLanguageSelection() {
        let language = LanguageSelectionViewController()
        navigationController.pushViewController(language, animated: true)
    }
    
    func goToUploadFromForYou() {
        let vc = DestinationViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }

}


