//
//  BooksRequest.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 10/02/22.
//

import Foundation


class BooksRequest {
    func requestBooks(page: Int, authCode: String, searchTerm: String, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)){
        
        let url = URL(string: "https://books.ioasys.com.br/api/v1/books?page=\(page)&amount=25&title=\(searchTerm)")
        print(searchTerm)
        guard let url = url else {
            print("Erro na URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(authCode)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            completion(data, response, error)
        }.resume()
        
    }
}
