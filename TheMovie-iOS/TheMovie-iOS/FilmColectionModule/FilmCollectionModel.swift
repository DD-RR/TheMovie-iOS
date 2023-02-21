//
//  FilmCollectionModel.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import Foundation
import UIKit

struct FilmCollectionService: Codable {
   let page: Int?
   let results: [FilmCollectionResult]?
}

struct FilmCollectionResult: Codable {
   let poster: String?
   let title: String
   let releaseDate: String
   let rating: Double
   let review: String
   
   enum CodingKeys: String, CodingKey {
      case poster = "poster_path"
      case title = "original_title"
      case releaseDate = "release_date"
      case rating = "popularity"
      case review = "overview"
   }
}

struct FilmList {
   static var imageBaseUrl: String = "https://image.tmdb.org/t/p/w300"
   var poster: UIImage
   let title: String
   let releaseDate: String
   let rating: Double
   let review: String
   
   init(from serviceResult: FilmCollectionResult) {
      let imageURLString: String = "\(FilmList.imageBaseUrl)\(serviceResult.poster ?? "")"
      let imageURL: URL = URL(string: imageURLString) ?? URL(fileURLWithPath: "")
      let posterImage: UIImage = UIImage(url: imageURL) ?? UIImage()
      
      self.poster = posterImage
      self.title = serviceResult.title
      self.releaseDate = serviceResult.releaseDate
      self.rating = serviceResult.rating
      self.review = serviceResult.review
   }
}

