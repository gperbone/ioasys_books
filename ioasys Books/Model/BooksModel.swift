//
//  BooksModel.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 10/02/22.
//

import Foundation


struct APIResponse: Codable {
    let data: [Book]
    let page, totalItems, totalPages: Float?
}

struct Book: Codable {
    let authors: [String]
    let title: String
    let description: String
    let pageCount: Int
    let category: String
    let imageUrl: String?
    let language: String
    let isbn10: String
    let isbn13: String
    let publisher: String
    let published: Int
    let id: String
}
