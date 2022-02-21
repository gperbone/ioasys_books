//
//  DetailedBookViewController.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 11/02/22.
//

import UIKit

class DetailedBookViewController: UIViewController {
    
    lazy var myBookView = DetailedBookView()
    
    var book:Book
    
    init(book: Book){
        self.book = book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = myBookView
        self.view.backgroundColor = .white
        myBookView.closeButton.addTarget(self, action: #selector(closeModal(_:)), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
    }
    
    func setUpView(){
        
        let view = myBookView
        
        //cover img
        let myString = book.imageUrl
        if myString != nil {
            if let myURL = URL(string: myString!){
                view.coverImage.load(url: myURL)
            }
        } else {
            if let myURL = URL(string: "https://d2drtqy2ezsot0.cloudfront.net/Book-7.jpg"){
                view.coverImage.load(url: myURL)
            }
        }
        
        
        view.bookTitleLbl.text = book.title
        for authorNumber in 0..<book.authors.count {
            view.bookAuthorLbl.text! += book.authors[authorNumber]
            view.bookAuthorLbl.text! += ", "
        }
        //remove last comma ", " in author
        view.bookPagesLbl.text = "\(book.pageCount) páginas"
        view.bookPublisherLbl.text = book.publisher
        view.bookPublishedDateLbl.text = "Publicado em \(book.published)"
        view.languageLbl.text = book.language
        view.originalTitleLbl.text = book.title //não presente na API
        view.isbn10Lbl.text = book.isbn10
        view.isbn13Lbl.text = book.isbn13
        view.summaryLbl.text = book.description
        
    }
    
    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
