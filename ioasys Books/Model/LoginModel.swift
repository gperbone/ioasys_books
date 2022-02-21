//
//  LoginModel.swift
//  ioasys Books
//
//  Created by Gustavo Perbone on 09/02/22.
//

import Foundation

//envio
struct LoginInformation: Codable {
    var email : String
    var password : String
}

//resposta

struct UserInformation: Codable {
    var name : String
    var email : String
    var birthdate : String
    var gender : String
    var id : String
}


struct HeaderInformation: Codable {
    var accessControlAllowOrigin, accessControlExposeHeaders, authorization, connection, contentLength, contentType, date, etag, server, xPoweredBy,refreshToken : String
    
    enum CodingKeys: String, CodingKey {
        case accessControlAllowOrigin = "Access-Control-Allow-Origin"
        case accessControlExposeHeaders = "Access-Control-Expose-Headers"
        case authorization = "Authorization"
        case connection = "Connection"
        case contentLength = "Content-Length"
        case contentType = "Content-Type"
        case date = "Date"
        case etag = "Etag"
        case server = "Server"
        case xPoweredBy = "X-Powered-By"
        case refreshToken = "refresh-token"
    }
}
