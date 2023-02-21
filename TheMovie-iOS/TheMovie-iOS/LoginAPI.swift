//
//  LoginAPI.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import Foundation

struct LoginAPI {
        typealias LoginResult = Result<LoginResponse, Error>
    let session: URLSession
    
    func send(_ endpoint: Endpoint, userLoginData: UserLoginData, completition: @escaping (LoginResult) -> Void) {
        var request = endpoint.request
        
        request.httpMethod = 
    }
}
