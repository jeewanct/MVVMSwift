//
//  RoundedLabel.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import UIKit

@IBDesignable
class RoundedLabel: UILabel{
    @IBInspectable var cornerRadius: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
