//
//  ProfileModel.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import Foundation
import UIKit

struct ProfileService: Codable {
    let page: Int?
    let results: [ProfileResults]
}

struct ProfileResults: Codable {
    let user: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case user = "poster_path"
        case name = "perfil_path"
    }
    
}

struct ProfileList {
    static var imageBaseUrl: String = "https://image.tmdb.org/t/p/w300"
    var user: UIImage
    let name: String
    
    init(from serviceResult: ProfileResults) {
        let imageURLString: String = "\(ProfileList.imageBaseUrl)\(serviceResult.user ?? "")"
        let imageURL: URL = URL(string: imageURLString) ?? URL(fileURLWithPath: "")
        let posterImage: UIImage = UIImage(url: imageURL) ?? UIImage()
        
        self.user = posterImage
        self.name = serviceResult.name
    }
}
