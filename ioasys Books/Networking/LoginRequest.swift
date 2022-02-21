//
//  LoginRequest.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation


class LoginRequest {
    func userLogin(email: String, password: String, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)){
        let parameters = LoginInformation(email: email, password: password)
        let parametersEncoded = try? JSONEncoder().encode(parameters)
        if let parametersEncoded = parametersEncoded{
            let url = URL(string: "https://books.ioasys.com.br/api/v1/auth/sign-in")
            guard let url = url else {
                print("Erro na URL")
                return
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = parametersEncoded
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                completion(data, response, error)
            }.resume()
        } else {
            print("Houve um erro na codificação do usuário!")
            return
        }
        
        
    }
}
