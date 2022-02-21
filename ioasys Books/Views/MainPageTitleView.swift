//
//  MainPageTitleView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation
import UIKit

class MainPageTitleView: UIView{
    
    // ioasys image
    lazy var ioasysTextLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "IoasysTextLogo")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    // books label
    lazy var booksLbl: UILabel = {
        let booksLbl = UILabel()
        booksLbl.text = "Books"
        booksLbl.font = UIFont(name: "Heebo-Light", size: 24)
        booksLbl.textColor =  UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        booksLbl.translatesAutoresizingMaskIntoConstraints = false
        return booksLbl
    }()
    
    // logout button
    lazy var logoutButton: UIButton = {
        let logoutButton = UIButton()
        let btnImage = UIImage(named: "LogOutIcon")
        logoutButton.setImage(btnImage , for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        return logoutButton
    }()
    
    //HStack with text components
    lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12.2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //HStack with components+button
    lazy var navigationTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 138.25
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
        self.addSubview(navigationTitleStackView)
        navigationTitleStackView.addArrangedSubview(textStackView)
        textStackView.addArrangedSubview(ioasysTextLogo)
        textStackView.addArrangedSubview(booksLbl)
        navigationTitleStackView.addArrangedSubview(logoutButton)
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        
    }
    
}
