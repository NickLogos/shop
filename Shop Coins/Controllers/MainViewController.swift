//
//  MainViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 10.10.23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    private let backgroundImage: UIImageView = {
        let backImage = UIImageView(image: UIImage(named: "mainWall"))
        backImage.contentMode = .scaleAspectFill
        return backImage
    }()
    
    private let logoImage: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "dragonWall"))
        logo.layer.cornerRadius = logo.frame.size.width / 4.1
        logo.clipsToBounds = true
        return logo
    }()
    
    private let loginButton: CustomButton = {
        let loginButton = CustomButton()
        loginButton.setTitle("Войти в аккаунт", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return loginButton
    }()
    
    private let registerButton: CustomButton = {
        let registerAction = CustomButton()
        registerAction.setTitle("Регистрация", for: .normal)
        registerAction.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return registerAction
    }()
    
    private let stackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 15
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        return buttonStack
    }()
    
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
        
        startRotationAnimation()
    }
    
    
    
    private func makeLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(stackView)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerButton)
    }
    
    private func makeConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(250)
            
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc func loginButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func registerButtonTapped() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    private func startRotationAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 7.0
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        
        logoImage.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}

