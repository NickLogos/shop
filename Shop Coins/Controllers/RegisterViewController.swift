//
//  RegisterViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 10.10.23.
//

import UIKit
import SnapKit
import Combine
import FirebaseAuth

class RegisterViewController: BasicViewController {
    
    
    private let backgroundPic: UIImageView = {
        let backImage = UIImageView(image: UIImage(named: "mainWall"))
        backImage.contentMode = .scaleAspectFill
        return backImage
    }()
    
    private let nameInput: CustomField = {
        let nameField = CustomField()
        nameField.placeholder = "Укажите Имя"
        return nameField
    }()
    
    private let newEmailInput: CustomField = {
        let emailField = CustomField()
        emailField.placeholder = "Укажите Email"
        return emailField
    }()
    
    private let newPasswordInput: CustomField = {
        let passField = CustomField()
        passField.placeholder = "Придумайте пароль"
        passField.isSecureTextEntry = true
        return passField
    }()
    
    private let registerButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        return button
    }()
    
    override init()  {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        
    }
    
    
    override func makeLayout() {
        view.addSubview(backgroundPic)
        view.addSubview(nameInput)
        view.addSubview(newEmailInput)
        view.addSubview(newPasswordInput)
        view.addSubview(registerButton)
    }
    
    override func makeConstraints() {
        
        backgroundPic.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        newEmailInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(nameInput.snp.bottom).offset(20)
        }
        
        newPasswordInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(newEmailInput.snp.bottom).offset(20)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(newPasswordInput.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func registerAction() {
        guard let login = newEmailInput.text,
              let password = newPasswordInput.text
        else { return }
        
        Auth.auth().createUser(withEmail: login, password: password) { [weak self] result, error in
            guard error == nil,
                  let result
            else {
                print(error!.localizedDescription)
                
                return
            }
            
            let vc = HomeViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

