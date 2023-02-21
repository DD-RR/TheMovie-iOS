//
//  LoginModel.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let expiresAt: String?
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case expireAt = "expires_at"
        case token = "request_token"
    }
}

struct UserLoginData {
    var username: String? = nil
    var password: String? = nil
}

enum TextFieldTag: Int {
    case username = 0
    case password = 1
}
