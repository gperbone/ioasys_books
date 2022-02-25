//
//  MainBooksViewController.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//
//for scrollview events
//https://guides.codepath.com/ios/Using-UIScrollView#registering-for-scroll-events


import UIKit

class MainBooksViewController: UIViewController, UIScrollViewDelegate {
    var currentUser: UserInformation
    var authCode: String
    lazy var myHomeView = HomeView()
    //timer e delay para o searchF
    var delayValue : Double = 1.0
    var timer:Timer?
    //variavel para saber qual pagina carregar!
    var page = 1
    
    init(currentUser: UserInformation, authCode: String){
        self.currentUser = currentUser
        self.authCode = authCode
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setando o delegate para poder identificar movimentos na scrollView
        myHomeView.scrollView.delegate = self
        
        
        self.view.backgroundColor = .white
        myHomeView.mainPageTitleView.logoutButton.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
        self.title = nil
        
        
        
        //para perceber quano algo for digitado nocampo de busca
        myHomeView.searchBarView.searchTextField.addTarget(self, action: #selector(textFieldDidChangeDelay), for: .editingChanged)
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = myHomeView
        myHomeView.welcomeTextView.nameLbl.text = "\(currentUser.name)!"
        loadBooks(page: 1, authCode: authCode, searchTerm: "")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //resetar variavel de número de página
        page = 1
        
        
        for subview in myHomeView.booksStackView.arrangedSubviews{
            updateButton(of: subview as! BookSummaryView)
        }
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.bounds
        let size = scrollView.contentSize
        let inset = scrollView.contentInset
        let y = offset.y + bounds.size.height - inset.bottom
        let h = size.height
        let reload_distance:CGFloat = 100.0
        if y > (h + reload_distance) {
            loadBooks(page: page, authCode: authCode, searchTerm: myHomeView.searchBarView.searchTextField.text!)
        }
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
        for view in myHomeView.booksStackView.arrangedSubviews{
            view.removeFromSuperview()
        }
        //faz a pesquisa
        loadBooks(page: 1, authCode: authCode, searchTerm: myHomeView.searchBarView.searchTextField.text!)
    }
    //
    //    func dataToDictionary(_ data: Data) -> [String: Any]? {
    //        try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    //    }
    
    func loadBooks(page: Int, authCode: String, searchTerm: String){
        BooksRequest().requestBooks(page: page, authCode: authCode, searchTerm: searchTerm) { data, response, error in
            if let error = error {
                print(error)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    print("Houve um erro!")
                    return
                }
                
                if response.statusCode >= 200 && response.statusCode <= 299{
                    do{
                        let myBookData = try JSONDecoder().decode(APIResponse.self, from: data!)
                        
                        DispatchQueue.main.async {
                            //para garantir que o scroll só adicione cada página uma vez, ncessita condição
                            if self.myHomeView.booksStackView.subviews.count == 25*(page-1)  {
                                //customizing BookSummaryView for each book
                                for currentBook in 0..<myBookData.data.count{
                                    print("add \(currentBook) na pagina \(page)")
                                    //add book to view
                                    let book = BookSummaryView()
            
                                    let myString = myBookData.data[currentBook].imageUrl
                                    if myString != nil {
                                        if let myURL = URL(string: myString!){
                                            book.coverImage.load(url: myURL)
                                        }
                                    } else {
                                        if let myURL = URL(string: "https://d2drtqy2ezsot0.cloudfront.net/Book-7.jpg"){
                                            book.coverImage.load(url: myURL)
                                        }
                                    }
                                    book.bookTitleLbl.text = myBookData.data[currentBook].title
                                    for authorNumber in 0..<myBookData.data[currentBook].authors.count {
                                        book.bookAuthorLbl.text! += myBookData.data[currentBook].authors[authorNumber]
                                        book.bookAuthorLbl.text! += ", "
                                    }
                                    //remove last comma ", " in author
                                    book.bookAuthorLbl.text!.removeLast(2)
                                    book.bookPagesLbl.text = "\(myBookData.data[currentBook].pageCount) páginas"
                                    book.bookPublisherLbl.text = myBookData.data[currentBook].publisher
                                    book.bookPublishedDateLbl.text = "Publicado em \(myBookData.data[currentBook].published)"
                                    
                                    book.bookID.text = myBookData.data[currentBook].id
                                    
                                    //adding each book to the stack and constraints
                                    self.myHomeView.booksStackView.addArrangedSubview(book)
                                    NSLayoutConstraint.activate([
                                        book.heightAnchor.constraint(equalToConstant: 160),
                                        book.centerXAnchor.constraint(equalTo: self.myHomeView.booksStackView.centerXAnchor)
                                    ])
                                    
                                    self.updateBookmarkButton(of: myBookData.data[currentBook], sender: book.bookmarkButton)
                                    
                                    // book.bookmarkButton.addTarget(self, action: #selector(self.toggleFavorite(_:)), for: .touchUpInside)
                                    book.bookmarkButton.addAction(UIAction(handler: { UIAction in
                                        self.toggleFavorite(of: myBookData.data[currentBook], sender: book.bookmarkButton)
                                    }), for: .touchUpInside)
                                    
                                    
                                    
                                    // adding action to view to show details of book (using extension below)
                                    book.addTapGesture {
                                        self.showDetailedView(of: myBookData.data[currentBook])
                                    }
                                    
                                }
                                //adiciona uma página, para saber qual carregar no próximo request
                                self.page += 1
                            }
                        }
                    }
                    catch{
                        print(error)
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
    
    func updateButton(of view: BookSummaryView){
        if let tabBarController = tabBarController as? TabBarController {
            if tabBarController.myBookmarkedBooks.bookmarkedBooks[(view.bookID.text)!] == nil{
                view.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            } else{
                view.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            }
        }
    }
    
}



//para carregar a imagem de capa dos livros
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



//extensao para conseguir clicar na View do Botão
//https://stackoverflow.com/questions/28675209/how-to-call-gesture-tap-on-uiview-programmatically-in-swift
extension UIView {
    
    func  addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}


