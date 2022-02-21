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
            if let bookmarkedBooksEncoded = try? JSONEncoder().encode(bookmarkedBooks) {
                UserDefaults.standard.set(bookmarkedBooksEncoded, forKey: "BookmarkedBooks")
            }
        }
    }
}
