//
//  ErrorLabel.swift
//  Shop Coins
//
//  Created by Nick Logos on 10.10.23.
//

import UIKit

class ErrorLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupErrorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupErrorLabel() {
        font = UIFont.systemFont(ofSize: 20)
        textColor = .red
        numberOfLines = 0
        
    }
}
