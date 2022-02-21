//
//  HomeView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation
import UIKit

class HomeView: UIView{
    //MainPageTitleView & WelcomeTextView & SearchBarView
    var mainPageTitleView = MainPageTitleView()
    var welcomeTextView = WelcomeTextView()
    var searchBarView = SearchBarView()
    
    //scrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // titles StackView
    lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // upperScreen StackView
    lazy var upperScreenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // books StackView
    lazy var booksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // main StackView
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //main, titulos,book
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
        self.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(upperScreenStackView)
        upperScreenStackView.addArrangedSubview(titlesStackView)
        titlesStackView.addArrangedSubview(mainPageTitleView)
        titlesStackView.addArrangedSubview(welcomeTextView)
        upperScreenStackView.addArrangedSubview(searchBarView)
        mainStackView.addArrangedSubview(booksStackView)
        
        //        for _ in 0..<10 {
        //            let myBook = BookSummaryView()
        //            booksStackView.addArrangedSubview(myBook)
        //        }
        
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        //ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        //mainStackView
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        //upperScreenStackView
        NSLayoutConstraint.activate([
            upperScreenStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            upperScreenStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            upperScreenStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            upperScreenStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        //titlesStackView
        NSLayoutConstraint.activate([
            titlesStackView.topAnchor.constraint(equalTo: upperScreenStackView.topAnchor),
            titlesStackView.leadingAnchor.constraint(equalTo: upperScreenStackView.leadingAnchor),
            titlesStackView.trailingAnchor.constraint(equalTo: upperScreenStackView.trailingAnchor),
            titlesStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        //booksStackView
        NSLayoutConstraint.activate([
            booksStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            booksStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            booksStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        //mainPageTitleView
        NSLayoutConstraint.activate([
            mainPageTitleView.leadingAnchor.constraint(equalTo: titlesStackView.leadingAnchor),
            mainPageTitleView.trailingAnchor.constraint(equalTo: titlesStackView.trailingAnchor),
            mainPageTitleView.heightAnchor.constraint(equalToConstant: 40),
        ])
        //welcomeTextView
        NSLayoutConstraint.activate([
            welcomeTextView.leadingAnchor.constraint(equalTo: titlesStackView.leadingAnchor),
            welcomeTextView.trailingAnchor.constraint(equalTo: titlesStackView.trailingAnchor),
            welcomeTextView.heightAnchor.constraint(equalToConstant: 16),
        ])
        //searchBarView
        NSLayoutConstraint.activate([
            searchBarView.heightAnchor.constraint(equalToConstant: 40),
            searchBarView.leadingAnchor.constraint(equalTo: upperScreenStackView.leadingAnchor),
            searchBarView.trailingAnchor.constraint(equalTo: upperScreenStackView.trailingAnchor),
            searchBarView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        //para dispensar o teclado ao clicar fora do textfield
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:))))
    }
    
    
    
}
