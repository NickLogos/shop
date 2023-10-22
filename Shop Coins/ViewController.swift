//
//  ViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 18.10.23.
//

import UIKit

class ViewController: BasicViewController {
    
    let manager = FireBaseDBmanager()
    
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
    
    private let surnameInput: CustomField = {
        let nameField = CustomField()
        nameField.placeholder = "Укажите Имя"
        return nameField
    }()
    
    private let one: CustomField = {
        let nameField = CustomField()
        nameField.placeholder = "Укажите Имя"
        return nameField
    }()
    
    private let two: CustomField = {
        let emailField = CustomField()
        emailField.placeholder = "Укажите Email"
        return emailField
    }()
    
    private let tree: CustomField = {
        let passField = CustomField()
        passField.placeholder = "Придумайте пароль"
        passField.isSecureTextEntry = true
        return passField
    }()
    
    private let five: CustomField = {
        let nameField = CustomField()
        nameField.placeholder = "Укажите Имя"
        return nameField
    }()
    
    private let six: CustomField = {
        let passField = CustomField()
        passField.placeholder = "Придумайте пароль"
        passField.isSecureTextEntry = true
        return passField
    }()
    
    private let seven: CustomField = {
        let nameField = CustomField()
        nameField.placeholder = "Укажите Имя"
        return nameField
    }()
    
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let saveButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        return button
    }()
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getCategories()
    }
    
     override func makeLayout() {
         view.addSubview(stackView)
         stackView.addArrangedSubview(nameInput)
         stackView.addArrangedSubview(newEmailInput)
         stackView.addArrangedSubview(newPasswordInput)
         stackView.addArrangedSubview(surnameInput)
         stackView.addArrangedSubview(one)
         stackView.addArrangedSubview(two)
         stackView.addArrangedSubview(tree)
         stackView.addArrangedSubview(five)
         stackView.addArrangedSubview(six)
         stackView.addArrangedSubview(seven)
         stackView.addArrangedSubview(saveButton)
        
    }
    
    override func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func saveAction() {
        manager.testPost(model: .init(about: "about", category: "Коллекционные фигуры", color: "pink", manufacture: "China", material: "Silver", name: "Coin", price: 54, weigh: 123, size: 19))
    }
}
