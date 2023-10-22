//
//  LoginViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 10.10.23.
//

import UIKit
import SnapKit
import FirebaseAuth

class LoginViewController: BasicViewController {
    
    
    private let backgroundPic: UIImageView = {
        let backImage = UIImageView(image: UIImage(named: "mainWall"))
        backImage.contentMode = .scaleAspectFill
        return backImage
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите Email"
        label.font = .italicSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    private var passwordLabel: UILabel = {
        let passLabel = UILabel()
        passLabel.text = "Введите Email"
        passLabel.font = .italicSystemFont(ofSize: 13)
        passLabel.textColor = .white
        return passLabel
    }()
    
    
    private let emailInput: CustomField = {
        let emailField = CustomField()
        emailField.placeholder = "Введите Email"
        return emailField
    }()
    
    private let passwordInput: CustomField = {
        let passwordField = CustomField()
        passwordField.placeholder = "Введите пароль"
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    private let errorLabel: ErrorLabel = {
        let label = ErrorLabel()
        label.isHidden = true
        label.text = "Неверные данные!"
        return label
    }()
    
    private let signinButton: CustomButton = {
        let signinButt = CustomButton()
        signinButt.setTitle("Войти в аккаунт", for: .normal)
        signinButt.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return signinButt
    }()
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Добро Пожаловать!"
        
        try? Auth.auth().signOut()
        
        if let userUid = Auth.auth().currentUser?.uid {
            print("юзер залогинен")
//            let homeVC = HomeViewController()
            
//            navigationController?.pushViewController(vc, animated: true)

        } else {
            print("юзер не залогинен")

        }
        
    }
    
    
    
    override func makeLayout() {
        view.addSubview(backgroundPic)
        view.addSubview(emailInput)
        view.addSubview(passwordInput)
        view.addSubview(errorLabel)
        view.addSubview(signinButton)
    }
    
    override func makeConstraints() {
        backgroundPic.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        emailInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        passwordInput.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(emailInput.snp.bottom).offset(20)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.greaterThanOrEqualTo(passwordInput.snp.bottom).offset(15)
        }
        
        signinButton.snp.makeConstraints { make in
            make.top.equalTo(errorLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func loginAction() {
        guard let email = emailInput.text,
              let password = passwordInput.text
        else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [ weak self ] result, error in
            guard let self else { return }
            if let error = error {
                print(error.localizedDescription)
            } else if let user = result?.user {
//                let tabVC = TabBarViewController()
//                navigationController?.pushViewController(tabVC, animated: true)
                let vc = ViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}


