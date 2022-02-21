//
//  SearchBarView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation
import UIKit

class SearchBarView: UIView{
    
    //image
    lazy var magnifyingGlassImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "magnifyingglass")
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    //welcome label
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Procure um livro"
        textField.attributedPlaceholder = NSAttributedString(string: "Procure um livro", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)])
        textField.font = UIFont(name: "Heebo-Regular", size: 14)
        textField.textColor = UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 1)
        textField.text = ""
        textField.autocapitalizationType = .none
        textField  .clearsOnBeginEditing = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //searchBarView
    lazy var searchBarView: UIView = {
        let searchBarView = UIView()
        searchBarView.backgroundColor = .white
        searchBarView.layer.cornerRadius = 8
        searchBarView.layer.shadowRadius = 24
        searchBarView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.09).cgColor
        searchBarView.layer.shadowOpacity = 1.0
        searchBarView.layer.shadowOffset = CGSize(width: 0, height: 4)
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        return searchBarView
    }()
    
    //stack
    lazy var searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 13
        stackView.alignment = .leading
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
        self.addSubview(searchBarView)
        searchBarView.addSubview(searchStackView)
        searchStackView.addArrangedSubview(magnifyingGlassImage)
        searchStackView.addArrangedSubview(searchTextField)
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        //searchBarView
        NSLayoutConstraint.activate([
            searchBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        //searchStackView
        NSLayoutConstraint.activate([
            searchStackView.centerXAnchor.constraint(equalTo: searchBarView.centerXAnchor),
            searchStackView.leadingAnchor.constraint(equalTo: searchBarView.leadingAnchor, constant: 12),
            searchStackView.trailingAnchor.constraint(equalTo: searchBarView.trailingAnchor, constant: -12),
            searchStackView.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: -9.5),
            searchStackView.topAnchor.constraint(equalTo: searchBarView.topAnchor, constant: 9.5)
        ])
        
        //magnifyingGlassImage
        NSLayoutConstraint.activate([
            magnifyingGlassImage.leadingAnchor.constraint(equalTo:   searchStackView.leadingAnchor),
            magnifyingGlassImage.bottomAnchor.constraint(equalTo:   searchStackView.bottomAnchor),
            magnifyingGlassImage.topAnchor.constraint(equalTo:  searchStackView.topAnchor),
            magnifyingGlassImage.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        //searchTextField
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo:   searchBarView.leadingAnchor, constant: 42),
            searchTextField.bottomAnchor.constraint(equalTo:   searchStackView.bottomAnchor),
            searchTextField.topAnchor.constraint(equalTo:  searchStackView.topAnchor)
        ])
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        
    }
    
}

