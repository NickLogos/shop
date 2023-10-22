//
//  Button.swift
//  Shop Coins
//
//  Created by Nick Logos on 10.10.23.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        backgroundColor = .lightGray
        alpha = 1.0
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 12
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let buttonHeight: CGFloat = 100
        frame.size.height = buttonHeight
    }
}
