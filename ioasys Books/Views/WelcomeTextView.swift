//
//  WelcomeTextView.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation
import UIKit

class WelcomeTextView: UIView{
    //welcome label
    lazy var welcomeLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Bem vindo, "
        lbl.textColor =  UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.font = UIFont(name: "Heebo-Regular", size: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //name label
    lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Guilherme!"
        lbl.textColor =  UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.font = UIFont(name: "Heebo-Medium", size: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //stack
    lazy var welcomeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
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
        self.addSubview(welcomeStackView)
        welcomeStackView.addArrangedSubview(welcomeLbl)
        welcomeStackView.addArrangedSubview(nameLbl)
    }
    
    //MARK: - Setup of the cnstraints
    func setConstraints(){
        
    }
    
    //MARK: - Setup of the actions
    func setActions(){
        
    }
    
}
