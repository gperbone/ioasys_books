//
//  TabBarController.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 12/02/22.
//

import UIKit

class TabBarController: UITabBarController {
    var currentUser : UserInformation
    var authCode: String
    
    //books info for bookmarked page
    var myBookmarkedBooks = BookmarkedBooks()
    
    
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
        
        
        let appearance = UITabBarAppearance()
       
        appearance.backgroundColor =  UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        tabBar.tintColor = .white
        
        
        
        let controller1 = MainBooksViewController(currentUser: currentUser, authCode: authCode)
        controller1.tabBarItem = UITabBarItem(title: "Início", image: UIImage(named: "homeTab"), selectedImage: UIImage(named: "homeTabSelected"))
        let nav1 = UINavigationController(rootViewController: controller1)
        
        
        let controller2 = FavoriteBooksViewController()
        controller2.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(named: "bookmarkTab"), selectedImage: UIImage(named: "bookmarkTabSelected"))
        let nav2 = UINavigationController(rootViewController: controller2)
        
        viewControllers = [nav1, nav2]
    }
    
    
}
