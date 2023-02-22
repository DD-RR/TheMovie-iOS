//
//  ProfileAPI.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import Foundation

struct ProfileAPI {
    let session: URLSession
    
    func load(_ endpoint: Endpoint, completion: @escaping (Result<ProfileResults, Error>) -> ()) {
        var request = endpoint.request
        
        request.httpMethod = HTTPMethod.GET.rawValue
        
        session.dataTask(with: request) { data, response, error in
            
            if let error: Error = error {
                completion(.failure(error))
                return
            }
            
            guard let data: Data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                let profile: ProfileResults = try JSONDecoder().decode(ProfileResults.self, from: data)
                completion(.success(profile))
                
            } catch {
                completion(.failure(APIError.parsingData))
            }
            
        }.resume()
    }
}
