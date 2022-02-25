//
//  FavoriteBooksViewController.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 12/02/22.
//

import UIKit

class FavoriteBooksViewController: UIViewController {
    lazy var myFavoriteView = HomeView()
    //timer e delay para o searchF
    var delayValue : Double = 1.0
    var timer:Timer?
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        myFavoriteView.mainPageTitleView.logoutButton.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
        self.title = nil
        
        //para perceber quano algo for digitado nocampo de busca
        myFavoriteView.searchBarView.searchTextField.addTarget(self, action: #selector(textFieldDidChangeDelay), for: .editingChanged)
    
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = myFavoriteView
        myFavoriteView.welcomeTextView.welcomeLbl.text = "Aqui estão os seus "
        myFavoriteView.welcomeTextView.nameLbl.text = "favoritos"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadBooks(searchTerm: "")
    }
    
    @IBAction func logout(_ sender: UIButton) {
        let loginPage = LoginViewController()
        
        if let tabBarController = tabBarController as? TabBarController {
            tabBarController.tabBar.isHidden = true
            self.tabBarController?.setViewControllers([loginPage], animated: false)

        }
    }

    @objc func textFieldDidChangeDelay() {
        //pesquisa apenas após o user deixar de digitar
        timer?.invalidate()
        //setup timer
        timer = Timer.scheduledTimer(timeInterval: delayValue, target: self, selector: #selector(self.doSearch), userInfo: nil, repeats: false)
    }
    
    @objc func doSearch(){
        //remove as views existentes na tela
        for view in myFavoriteView.booksStackView.arrangedSubviews{
            view.removeFromSuperview()
        }
        //faz a pesquisa
        loadBooks(searchTerm: myFavoriteView.searchBarView.searchTextField.text!)
    }

    
    func loadBooks(searchTerm: String){
        for subview in self.myFavoriteView.booksStackView.arrangedSubviews{
            subview.removeFromSuperview()
        }
        
        if let tabBarController = tabBarController as? TabBarController {
            for currentBook in tabBarController.myBookmarkedBooks.bookmarkedBooks{
                if currentBook.value.title.contains(searchTerm)  || searchTerm == ""{
                    let book = BookSummaryView()
                    
                    let myString = currentBook.value.imageUrl
                    if myString != nil {
                        if let myURL = URL(string: myString!){
                            book.coverImage.load(url: myURL)
                        }
                    } else {
                        if let myURL = URL(string: "https://d2drtqy2ezsot0.cloudfront.net/Book-7.jpg"){
                            book.coverImage.load(url: myURL)
                        }
                    }
                    
                    book.bookTitleLbl.text = currentBook.value.title
                    for authorNumber in 0..<currentBook.value.authors.count {
                        book.bookAuthorLbl.text! += currentBook.value.authors[authorNumber]
                        book.bookAuthorLbl.text! += ", "
                    }
                    //remove last comma ", " in author
                    book.bookAuthorLbl.text!.removeLast(2)
                    book.bookPagesLbl.text = "\(currentBook.value.pageCount) páginas"
                    book.bookPublisherLbl.text = currentBook.value.publisher
                    book.bookPublishedDateLbl.text = "Publicado em \(currentBook.value.published)"
                    
                    
                    //adding each book to the stack and constraints
                    self.myFavoriteView.booksStackView.addArrangedSubview(book)
                    NSLayoutConstraint.activate([
                        book.leadingAnchor.constraint(equalTo: self.myFavoriteView.booksStackView.leadingAnchor),
                        book.trailingAnchor.constraint(equalTo: self.myFavoriteView.booksStackView.trailingAnchor),
                        book.heightAnchor.constraint(equalToConstant: 160),
                        book.centerXAnchor.constraint(equalTo: self.myFavoriteView.booksStackView.centerXAnchor)
                    ])
                    
                    self.updateBookmarkButton(of: currentBook.value, sender: book.bookmarkButton)
                    
                    // book.bookmarkButton.addTarget(self, action: #selector(self.toggleFavorite(_:)), for: .touchUpInside)
                     book.bookmarkButton.addAction(UIAction(handler: { UIAction in
                         self.toggleFavorite(of: currentBook.value, sender: book.bookmarkButton)
                     }), for: .touchUpInside)
                     
                     
                     // adding action to view to show details of book (using extension below)
                     book.addTapGesture {
                         self.showDetailedView(of: currentBook.value)
                     }
                }
        }
        }
    }
           
    
    
    func showDetailedView(of book: Book) {
        let detailedBookViewController = DetailedBookViewController(book: book)
        
        present(detailedBookViewController, animated: true, completion: nil)
    }

    
    func toggleFavorite(of book : Book, sender: UIButton) {
        //acessando a tabBar para acessar a instancia de bookmarkedbooks que há lá
        if let tabBarController = tabBarController as? TabBarController {
           
            if tabBarController.myBookmarkedBooks.bookmarkedBooks[book.id] == nil{
            
                tabBarController.myBookmarkedBooks.bookmarkedBooks[book.id] = book
                sender.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else{
                
                tabBarController.myBookmarkedBooks.bookmarkedBooks[book.id] = nil
                sender.setImage(UIImage(systemName: "bookmark"), for: .normal)
            }
        }
        
        loadBooks(searchTerm: myFavoriteView.searchBarView.searchTextField.text!)
    }
    
    func updateBookmarkButton(of book : Book, sender: UIButton) {
        //acessando a tabBar para acessar a instancia de bookmarkedbooks que há lá
        if let tabBarController = tabBarController as? TabBarController {
            if tabBarController.myBookmarkedBooks.bookmarkedBooks[book.id] == nil{
                sender.setImage(UIImage(systemName: "bookmark"), for: .normal)
            } else{
                sender.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            }
            
        }
        
    }
    
    
}
