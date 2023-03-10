//
//  Endpoint.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import Foundation

enum Endpoint {
    static let baseURL = "https://api.themoviedb.org/3/"
    case login
    case films
    case profile
}

extension Endpoint {
    var apiKey: String {
        Credentials.apiKey
    }
    var string: String {
       switch self {
          case .login:
             return "authentication/token/validate_with_login?api_key=\(apiKey)"
          case .films:
             return "trending/movie/week?api_key=\(apiKey)"
       case .profile:
           return "person/1003?api_key=api_key=\(apiKey)&language=en-US"
       }
    }
    
    var request: URLRequest {
        switch self {
        case.login, .films, .profile:
            let url: URL = URL(string: Endpoint.baseURL + string) ?? URL(fileURLWithPath: "")
            return URLRequest(url: url)
        }
    }
}
