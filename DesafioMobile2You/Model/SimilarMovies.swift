//
//  SimilarMovies.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 05/02/22.
//

import Foundation

struct SimilarMovie: Codable {
    
    var results: [MovieList]
}

struct MovieList: Codable {
    
    var id: Int
    var backdrop_path: String
    var title: String
    let genre_ids: [Int]
    var release_date: String
}
