//
//  PaddedLabel.swift
//  ALOWCoordinator
//
//  Created by User on 22.05.25.
//

import UIKit
class PaddedLabel: UILabel {
    var padding = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }
}

