//
//  APIError.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import Foundation

enum APIError: Error {
     case noData
     case response
     case parsingData
     case internalServer
}
