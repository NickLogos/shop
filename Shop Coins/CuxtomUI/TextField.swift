//
//  TextField.swift
//  Shop Coins
//
//  Created by Nick Logos on 10.10.23.
//

import UIKit

class CustomField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupField()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupField() {
        backgroundColor = .lightGray
        textColor = .black
        font = UIFont.systemFont(ofSize: 16)
        borderStyle = .roundedRect
        autocorrectionType = .no
        autocapitalizationType = .none
    }
}
