//
//  BasicViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 11.10.23.
//

import UIKit
import Combine

class BasicViewController: UIViewController {
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        makeConstraints()
        binding()
        
    }
    
    func makeLayout() {}
    
    func makeConstraints() {}
    
    func binding() {}
}

