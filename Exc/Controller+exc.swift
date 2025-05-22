//
//  Controller+exc.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import UIKit

extension UIViewController {
    static var coordinator: MainCoordinator?
    
    static var identifier :String {
        String(describing: self)
    }
}
