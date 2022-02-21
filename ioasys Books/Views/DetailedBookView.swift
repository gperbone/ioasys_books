//
//  DetailedBookView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 11/02/22.
//

import Foundation
import UIKit

class DetailedBookView: UIView{
    //page title
    lazy var detailsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Detalhes"
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.font = UIFont(name: "Heebo-Medium", size: 16)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    //imagem da Capa
    lazy var coverImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Book-7")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        imgView.layer.shadowOpacity = 1
        imgView.layer.shadowRadius = 30
        imgView.layer.shadowOffset = CGSize(width: 0, height: 12)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    //book title label
    lazy var bookTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sprint"
        lbl.font = UIFont(name: "Heebo-Medium", size: 28)
        lbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book author label
    lazy var bookAuthorLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.502, alpha: 1)
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //informations label
    lazy var informationsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "INFORMAÇÕES"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book pages label
    lazy var bookPagesTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Páginas"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book pages label
    lazy var bookPagesLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "12 páginas"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book publisher title label
    lazy var bookPublisherTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Editora"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book publisher label
    lazy var bookPublisherLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Editora Loyola"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book published date title label
    lazy var bookPublishedDateTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Publicação"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book published date label
    lazy var bookPublishedDateLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Publicado em 2002"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //language title label
    lazy var languageTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Idioma"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //language label
    lazy var languageLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Inglês"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //org titletitle label
    lazy var originalTitleTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Título Original"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //org title label
    lazy var originalTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "English Orignal"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //isbn-10 title label
    lazy var isbn10TitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "ISBN-10"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //isbn10 label
    lazy var isbn10Lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "098765445678"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //isbn-13 title label
    lazy var isbn13TitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "ISBN-13"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //isbn13 label
    lazy var isbn13Lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "978-65445674348"
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //SUMMARY TITLE label
    lazy var summaryTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "RESENHA DA EDITORA"
        lbl.font = UIFont(name: "Heebo-Medium", size: 14)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //summary label
    lazy var summaryLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = """
            The subject of “design thinking” is the rage at business schools, throughout corporations, and increasingly in the popular press—due in large part to the work of IDEO, a leading design firm, and its celebrated CEO, Tim Brown, who uses this book to show how the techniques and strategies of design belong at every level of business.
        """
        lbl.font = UIFont(name: "Heebo-Regular", size: 14)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //scrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //stack vertical para todas infos
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack vertical para parte INFORMAÇÕES
    lazy var bookInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para PÁGINAS
    lazy var pagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para PUBLISHER
    lazy var publisherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para PUBLISHED DATE
    lazy var publishedDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para LANGUAGE
    lazy var languageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para ORIGINAL TITLE
    lazy var originalTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para ISBN10
    lazy var isbn10StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para ISBN13
    lazy var isbn13StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack horizontal para posicionar botão de fechar
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 114
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = UIColor(red: 0.671, green: 0.149, blue: 0.502, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
        self.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(detailsLbl)
        topStackView.addArrangedSubview(closeButton)
        mainStackView.addArrangedSubview(coverImage)
        mainStackView.addArrangedSubview(bookTitleLbl)
        mainStackView.addArrangedSubview(bookAuthorLbl)
        mainStackView.addArrangedSubview(informationsLbl)
        mainStackView.addArrangedSubview(bookInformationStackView)
        bookInformationStackView.addArrangedSubview(pagesStackView)
        pagesStackView.addArrangedSubview(bookPagesTitleLbl)
        pagesStackView.addArrangedSubview(bookPagesLbl)
        bookInformationStackView.addArrangedSubview(publisherStackView)
        publisherStackView.addArrangedSubview(bookPublisherTitleLbl)
        publisherStackView.addArrangedSubview(bookPublisherLbl)
        bookInformationStackView.addArrangedSubview(publishedDateStackView)
        publishedDateStackView.addArrangedSubview(bookPublishedDateTitleLbl)
        publishedDateStackView.addArrangedSubview(bookPublishedDateLbl)
        bookInformationStackView.addArrangedSubview(languageStackView)
        languageStackView.addArrangedSubview(languageTitleLbl)
        languageStackView.addArrangedSubview(languageLbl)
        bookInformationStackView.addArrangedSubview(originalTitleStackView)
        originalTitleStackView.addArrangedSubview(originalTitleTitleLbl)
        originalTitleStackView.addArrangedSubview(originalTitleLbl)
        bookInformationStackView.addArrangedSubview(isbn10StackView)
        isbn10StackView.addArrangedSubview(isbn10TitleLbl)
        isbn10StackView.addArrangedSubview(isbn10Lbl)
        bookInformationStackView.addArrangedSubview(isbn13StackView)
        isbn13StackView.addArrangedSubview(isbn13TitleLbl)
        isbn13StackView.addArrangedSubview(isbn13Lbl)
        mainStackView.addArrangedSubview(summaryTitleLbl)
        mainStackView.addArrangedSubview(summaryLbl)
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
            mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        //topStackView
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 20),
            topStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            topStackView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor)
        ])
        
        //detailsLbl
        NSLayoutConstraint.activate([
            detailsLbl.centerXAnchor.constraint(equalTo: topStackView.centerXAnchor),
            detailsLbl.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        //closebutton
        NSLayoutConstraint.activate([
            // closeButton.trailingAnchor.constraint(equalTo: closeViewContainer.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 12),
            closeButton.heightAnchor.constraint(equalToConstant: 12),
            
        ])
        
        //        //coverImage
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 24),
            coverImage.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            coverImage.widthAnchor.constraint(equalToConstant: 168),
            coverImage.heightAnchor.constraint(equalToConstant: 247),
        ])
        
        //book title
        NSLayoutConstraint.activate([
            bookTitleLbl.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 32),
            bookTitleLbl.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
        ])
        
        //author title
        NSLayoutConstraint.activate([
            bookAuthorLbl.topAnchor.constraint(equalTo: bookTitleLbl.bottomAnchor, constant: 8),
            bookAuthorLbl.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
        ])
        
        //information label
        NSLayoutConstraint.activate([
            informationsLbl.topAnchor.constraint(equalTo: bookAuthorLbl.bottomAnchor, constant: 32),
            informationsLbl.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
        ])
        
        //stack das infos
        NSLayoutConstraint.activate([
            bookInformationStackView.topAnchor.constraint(equalTo: informationsLbl.bottomAnchor, constant: 19),
            bookInformationStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
        ])
        
        //título RESENHA DA EDITORA
        NSLayoutConstraint.activate([
            summaryTitleLbl.topAnchor.constraint(equalTo: bookInformationStackView.bottomAnchor, constant: 32),
            summaryTitleLbl.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
        ])
        
        //RESENHA
        NSLayoutConstraint.activate([
            summaryLbl.topAnchor.constraint(equalTo: summaryTitleLbl.bottomAnchor, constant: 19),
            summaryLbl.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
        ])
        
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        //action set in view controller
    }
    
    
    
}

