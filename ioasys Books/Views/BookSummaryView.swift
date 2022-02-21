//
//  BookSummaryView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//
//https://www.allaboutswift.com/dev/2016/5/14/stackviews-in-ios9

import Foundation
import UIKit

class BookSummaryView: UIView{
    
    //imagem da Capa
    lazy var coverImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Book-7")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        imgView.layer.shadowOpacity = 1
        imgView.layer.shadowRadius = 9
        imgView.layer.shadowOffset = CGSize(width: 0, height: 6)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    //book title label
    lazy var bookTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sprint"
        lbl.font = UIFont(name: "Heebo-Medium", size: 16)
        lbl.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
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
    
    //book pages label
    lazy var bookPagesLbl: UILabel = {
        let lbl = UILabel()
        let number = 150
        lbl.text = "\(number) páginas"
        lbl.font = UIFont(name: "Heebo-Regular", size: 12)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book publisher label
    lazy var bookPublisherLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Editora Loyola"
        lbl.font = UIFont(name: "Heebo-Regular", size: 12)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //book published date label
    lazy var bookPublishedDateLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Publicado em 2002"
        lbl.font = UIFont(name: "Heebo-Regular", size: 12)
        lbl.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //Botão de favorito
    lazy var bookmarkButton: UIButton = {
        let btn = UIButton()
        let btnImage = UIImage(systemName: "bookmark")
        btn.setImage(btnImage , for: .normal)
        btn.tintColor = UIColor(red: 0.671, green: 0.149, blue: 0.502, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //stack para infos principais do livro
    lazy var mainInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack para infos secundarias do livro
    lazy var secondaryInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack para infos do livro
    lazy var bookInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //stack para card do livro
    lazy var bookCardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //view com a card do livro
    lazy var bookCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.09).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 24
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //bookmarkViewContainer para poder colocar o botão na parte superior. Programei este como um button para aumentar a area de clique do botão de bookmark
    lazy var bookmarkViewContainerButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //book id
    lazy var bookID: UILabel = {
        let lbl = UILabel()
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
        self.addSubview(bookCardView)
        bookCardView.addSubview(bookCardStackView)
        bookCardStackView.addArrangedSubview(coverImage)
        bookCardStackView.addArrangedSubview(bookInfoStackView)
        bookInfoStackView.addArrangedSubview(mainInfoStackView)
        mainInfoStackView.addArrangedSubview(bookTitleLbl)
        mainInfoStackView.addArrangedSubview(bookAuthorLbl)
        bookInfoStackView.addArrangedSubview(secondaryInfoStackView)
        secondaryInfoStackView.addArrangedSubview(bookPagesLbl)
        secondaryInfoStackView.addArrangedSubview(bookPublisherLbl)
        secondaryInfoStackView.addArrangedSubview(bookPublishedDateLbl)
        bookCardStackView.addArrangedSubview(bookmarkViewContainerButton)
        bookmarkViewContainerButton.addSubview(bookmarkButton)
        
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        //bookCardView
        NSLayoutConstraint.activate([
            bookCardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            // bookCardView.widthAnchor.constraint(equalToConstant: 328),
            bookCardView.heightAnchor.constraint(equalToConstant: 160),
        ])
        
        //bookCardStackView
        NSLayoutConstraint.activate([
            bookCardStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bookCardStackView.leadingAnchor.constraint(equalTo: bookCardView.leadingAnchor, constant: 24),
            //bookCardStackView.trailingAnchor.constraint(equalTo: bookCardView.trailingAnchor, constant: -22),
            bookCardStackView.topAnchor.constraint(equalTo: bookCardView.topAnchor, constant: 16),
            bookCardStackView.bottomAnchor.constraint(equalTo: bookCardView.bottomAnchor, constant: -16)
        ])
        
        //coverImage
        NSLayoutConstraint.activate([
            // coverImage.widthAnchor.constraint(equalToConstant: 81),
            //coverImage.heightAnchor.constraint(equalToConstant: 122),
            coverImage.leadingAnchor.constraint(equalTo: bookCardView.leadingAnchor, constant:24),
            // coverImage.topAnchor.constraint(equalTo: bookCardView.topAnchor, constant: 19),
            // coverImage.bottomAnchor.constraint(equalTo: bookCardView.bottomAnchor, constant: -19),
            coverImage.trailingAnchor.constraint(equalTo: bookCardView.leadingAnchor, constant: 105)
        ])
        
        
        //bookmarkButton
        NSLayoutConstraint.activate([
            bookmarkButton.topAnchor.constraint(equalTo: bookmarkViewContainerButton.topAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: bookCardStackView.trailingAnchor)
        ])
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        //bookmark function in viewcontroller
    }
    
    
}
