//
//  BookmarkedBooks.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 21/02/22.
//

import Foundation

class BookmarkedBooks {
    var bookmarkedBooks = [String : Book]() {
        didSet {
            let encoder = JSONEncoder()
            if let bookmarkedBooksEncoded = try? encoder.encode(bookmarkedBooks) {
                UserDefaults.standard.set(bookmarkedBooksEncoded, forKey: "BookmarkedBooks")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "BookmarkedBooks") {
            if let decodedItems = try? JSONDecoder().decode([String : Book].self, from: savedItems) {
                bookmarkedBooks = decodedItems
                return
            }
        }

        bookmarkedBooks = [:]
    }
}
