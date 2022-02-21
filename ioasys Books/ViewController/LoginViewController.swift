//
//  LoginViewController.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 08/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var myLoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addBackground()

        myLoginView.loginScreen.enterButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = myLoginView
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard let emailText = myLoginView.loginScreen.emailTextField.text else {
            myLoginView.loginScreen.emailTextFieldView.layer.borderColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1).cgColor
            return
        }
        
        if !emailText.contains(".com") || !emailText.contains("@")  {
            myLoginView.loginScreen.emailTextFieldView.layer.borderColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1).cgColor
            myLoginView.loginScreen.emailTextField.textColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1)
            myLoginView.loginScreen.emailLbl.textColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1)
            myLoginView.loginScreen.invalidMailLbl.isHidden = false
        } else {
            myLoginView.loginScreen.emailTextFieldView.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
            myLoginView.loginScreen.emailTextField.textColor = UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 1)
            myLoginView.loginScreen.emailLbl.textColor = UIColor(red: 0.224, green: 0.082, blue: 0.294, alpha: 1)
            myLoginView.loginScreen.invalidMailLbl.isHidden = true
            
            //se houver email e senha digitado, tenta o login
            if let passwordText = myLoginView.loginScreen.passwordTextField.text {
                //desafio@ioasys.com.br - 12341234
                requestLogin(email: emailText, password: passwordText)
            }
        }
    }
    
    
    private func requestLogin(email: String, password: String) {
        LoginRequest().userLogin(email: email, password: password) { data, response, error in
            if let error = error {
                print(error)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    print("Houve um erro!")
                    return
                }
                
                if response.statusCode >= 200 && response.statusCode <= 299{
                    do{
                        let myData = try JSONDecoder().decode(UserInformation.self, from: data!)
                        let authCode = response.allHeaderFields["Authorization"]! as! String
                        
                        DispatchQueue.main.async {
                            self.navigateToHome(using: myData, withAuthorization: authCode)
                        }
                    }
                    catch{
                        print(error)
                    }
                } else if response.statusCode < 200 || response.statusCode > 299{
                    DispatchQueue.main.async {
                        //caso o email ou senha digitado nao sejam os do banco de dados
                        self.wrongLoginInfo()
                    }
                }
                
            }
        }
    }
    
    private func wrongLoginInfo(){
        self.myLoginView.loginScreen.emailTextFieldView.layer.borderColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1).cgColor
        self.myLoginView.loginScreen.emailTextField.textColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1)
        self.myLoginView.loginScreen.emailLbl.textColor = UIColor(red: 0.741, green: 0.306, blue: 0.306, alpha: 1)
        self.myLoginView.loginScreen.invalidMailLbl.isHidden = false
    }
    
    private func navigateToHome(using user: UserInformation, withAuthorization authCode: String ) {
        //let homeViewController = MainBooksViewController(currentUser: user, authCode: authCode)
        let tabBarController = TabBarController(currentUser: user, authCode: authCode)
        self.navigationController?.setViewControllers([tabBarController], animated: true)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    

}

//https://stackoverflow.com/questions/27153181/how-do-you-make-a-background-image-scale-to-screen-size-in-swift/41581146#41581146
extension UIView {
    func addBackground(imageName: String = "LoginBackground.png", contentMode: UIView.ContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
