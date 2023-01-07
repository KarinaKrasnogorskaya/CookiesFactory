//
//  CustomLabel.swift
//  CookiesFactory
//
//  Created by Карина on 20.12.2022.
//

import UIKit
class CustomLabel: UILabel {
    
    init(title: String, color: UIColor) {
        super.init(frame: .zero)
        setupLabel(title: title, color: color)
        
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(title: String, color: UIColor) {
        tintColor = color
        text = title
       
        
    }
}
