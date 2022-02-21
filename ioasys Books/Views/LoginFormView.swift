//
//  LoginFormView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 08/02/22.
//
//https://pedroalvarez-29395.medium.com/view-code-em-ios-a-control-framework-to-eliminate-interface-builders-449fa1884958


import Foundation
import UIKit

class LoginFormView : UIView {
    
    //MARK: - SetUp of all components in the screen
    
    // CAMPO DE EMAIL
    lazy var emailLbl: UILabel = {
        let emailLbl = UILabel()
        emailLbl.text = "Email"
        emailLbl.font = UIFont(name: "Roboto-Medium", size: 12)
        emailLbl.textAlignment = .left
        emailLbl.textColor = .clear
        emailLbl.translatesAutoresizingMaskIntoConstraints = false
        return emailLbl
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.attributedPlaceholder =
        NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 0.5)])
        emailTextField.font = UIFont(name: "Roboto-Regular", size: 16)
        emailTextField.autocapitalizationType = .none
        emailTextField.textColor = UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 1)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    lazy var emailTextFieldView: UIView = {
        let emailTextFieldView = UIView()
        emailTextFieldView.layer.cornerRadius = 8
        emailTextFieldView.layer.borderWidth = 1
        emailTextFieldView.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        return emailTextFieldView
    }()
    
    //CAMPO DE SENHA
    lazy var passwordLbl: UILabel = {
        let passwordLbl = UILabel()
        passwordLbl.text = "Senha"
        passwordLbl.textColor = .clear
        passwordLbl.font = UIFont(name: "Roboto-Medium", size: 12)
        passwordLbl.textAlignment = .left
        passwordLbl.translatesAutoresizingMaskIntoConstraints = false
        return passwordLbl
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.attributedPlaceholder =
        NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 0.5)])
        passwordTextField.font = UIFont(name: "Roboto-Regular", size: 16)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.textColor = UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 1)
        passwordTextField.isSecureTextEntry = true
        passwordTextField  .clearsOnBeginEditing = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    lazy var passwordTextFieldView: UIView = {
        let passwordTextFieldView = UIView()
        passwordTextFieldView.layer.cornerRadius = 8
        passwordTextFieldView.layer.borderWidth = 1
        passwordTextFieldView.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextFieldView
    }()
    
    lazy var passwordShowButton: UIButton = {
        let passwordShowButton = UIButton()
        let btnImage = UIImage(systemName: "eye.slash")
        passwordShowButton.setImage(btnImage , for: .normal)
        passwordShowButton.tintColor = UIColor(red: 0.678, green: 0.678, blue: 0.678, alpha: 1)
        passwordShowButton.translatesAutoresizingMaskIntoConstraints = false
        return passwordShowButton
    }()
    
    //BOTAO DE ENTRAR
    lazy var enterButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("ENTRAR", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Heebo-Medium", size: 14)
        loginButton.layer.backgroundColor = UIColor(red: 0.224, green: 0.082, blue: 0.294, alpha: 1).cgColor
        loginButton.layer.cornerRadius = 8
        return loginButton
    }()
    
    
    //STACK VIEW PARA O FORM, com espaço 68
    lazy var formStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 68
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //STACK VIEW PARA OS CAMPOS DE INPUT, com espaço 28
    lazy var inputFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 28
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //STACK VIEW para colocar label no campo de email
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //STACK VIEW para colocar label no campo de password
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //STACKVIEW horizontal para juntar TextField da senha e botão para mostrar senha
    lazy var passwordFieldButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //ENDEREÇO DE EMAIL INVALIDO
    lazy var invalidMailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Endereço de email inválido"
        lbl.textAlignment = .left
        lbl.isHidden = true
        lbl.font = UIFont(name: "Roboto-Medium", size: 12)
        lbl.textColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setSubviews()
        setConstraints()
        setActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup of the subviews
    func setSubviews(){
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubview(formStackView)
        formStackView.addArrangedSubview(inputFieldsStackView)
        inputFieldsStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLbl)
        emailStackView.addArrangedSubview(emailTextFieldView)
        emailTextFieldView.addSubview(emailTextField)
        emailStackView.addArrangedSubview(invalidMailLbl)
        inputFieldsStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLbl)
        passwordStackView.addArrangedSubview(passwordTextFieldView)
        passwordTextFieldView.addSubview(passwordFieldButtonStackView)
        passwordFieldButtonStackView.addArrangedSubview(passwordTextField)
        passwordFieldButtonStackView.addArrangedSubview(passwordShowButton)
        formStackView.addArrangedSubview(enterButton)
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        //formStackView
        NSLayoutConstraint.activate([
            formStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            formStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            formStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)
        ])
        
        //inputFieldsStackView
        NSLayoutConstraint.activate([
            inputFieldsStackView.centerXAnchor.constraint(equalTo: formStackView.centerXAnchor)
        ])
        
        //emailStackView
        NSLayoutConstraint.activate([
            emailStackView.centerXAnchor.constraint(equalTo: inputFieldsStackView.centerXAnchor)
        ])
        
        //emaillbl
        
        
        //emailTextFieldView
        NSLayoutConstraint.activate([
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        //emailTextField
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -16),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 12),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -12)
        ])
        
        
        //passwordStackView
        NSLayoutConstraint.activate([
            passwordStackView.centerXAnchor.constraint(equalTo: formStackView.centerXAnchor)
        ])
        
        //passwordlbl
        
        //passwordTextFieldView
        NSLayoutConstraint.activate([
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        //passwordFieldButtonStackView
        NSLayoutConstraint.activate([
            passwordFieldButtonStackView.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 16),
            passwordFieldButtonStackView.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -16),
            passwordFieldButtonStackView.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 12),
            passwordFieldButtonStackView.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -12)
        ])
        
        //passwordTextField
        //passwordShowButton
        //enterbutton
        NSLayoutConstraint.activate([
            enterButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        passwordShowButton.addTarget(self, action: #selector(showPassword(_:)), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(showEmailLabel), for: .touchDown)
        passwordTextField.addTarget(self, action: #selector(showPasswordLabel), for: .touchDown)
    }
    
    @IBAction func showPassword(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry == true{
            let btnImage = UIImage(systemName: "eye.slash")
            passwordShowButton.setImage(btnImage , for: .normal)
        } else {
            let btnImage = UIImage(systemName: "eye")
            passwordShowButton.setImage(btnImage , for: .normal)
        }
    }
    
    //shows label when is textfield is touched
    @objc func showEmailLabel(textField: UITextField) {
        emailLbl.textColor = UIColor(red: 0.224, green: 0.082, blue: 0.294, alpha: 1)
    }
    
    //shows label when is textfield is touched
    @objc func showPasswordLabel(textField: UITextField) {
        passwordLbl.textColor = UIColor(red: 0.224, green: 0.082, blue: 0.294, alpha: 1)
    }
}

