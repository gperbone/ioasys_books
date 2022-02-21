//
//  LoginView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation
import UIKit

class LoginView : UIView {
    
    //MARK: - SetUp of all components in the screen
    // ioasys image
    lazy var ioasysTextLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "IoasysBooksTextLogoWhite")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    //loginScreen
    lazy var loginScreen = LoginFormView()
    
    
    //StackView Upper Page
    lazy var upperPageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //StackView Lower Page
    lazy var lowerPageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.layer.cornerRadius = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //StackView Page
    lazy var fullPageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        self.addSubview(fullPageStackView)
        fullPageStackView.addArrangedSubview(upperPageStackView)
        upperPageStackView.addArrangedSubview(ioasysTextLogo)
        fullPageStackView.addArrangedSubview(lowerPageStackView)
        lowerPageStackView.addArrangedSubview(loginScreen)
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        //fullPageStackView
        NSLayoutConstraint.activate([
            fullPageStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullPageStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullPageStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fullPageStackView.topAnchor.constraint(equalTo:  topAnchor)
        ])
        
        //upperPageStackView
        NSLayoutConstraint.activate([
            upperPageStackView.leadingAnchor.constraint(equalTo: fullPageStackView.leadingAnchor),
            upperPageStackView.trailingAnchor.constraint(equalTo: fullPageStackView.trailingAnchor),
            upperPageStackView.topAnchor.constraint(equalTo:  fullPageStackView.topAnchor),
        ])
        
        //lowerPageStackView
        NSLayoutConstraint.activate([
            lowerPageStackView.leadingAnchor.constraint(equalTo: fullPageStackView.leadingAnchor),
            lowerPageStackView.trailingAnchor.constraint(equalTo: fullPageStackView.trailingAnchor),
            lowerPageStackView.bottomAnchor.constraint(equalTo:  fullPageStackView.bottomAnchor),
            lowerPageStackView.heightAnchor.constraint(equalTo: fullPageStackView.heightAnchor, multiplier: (0.48))
            
        ])
        
        //ioasysTextLogo
        NSLayoutConstraint.activate([
            ioasysTextLogo.centerXAnchor.constraint(equalTo: upperPageStackView.centerXAnchor),
            ioasysTextLogo.centerYAnchor.constraint(equalTo: upperPageStackView.centerYAnchor)
        ])
        
        
        //loginScreen
        NSLayoutConstraint.activate([
            loginScreen.leadingAnchor.constraint(equalTo: lowerPageStackView.leadingAnchor),
            loginScreen.trailingAnchor.constraint(equalTo: lowerPageStackView.trailingAnchor),
            loginScreen.bottomAnchor.constraint(equalTo:  lowerPageStackView.bottomAnchor),
            loginScreen.topAnchor.constraint(equalTo:  lowerPageStackView.topAnchor),
        ])
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        //para dispensar o teclado ao clicar fora do textfield
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:))))
    }
    
}

