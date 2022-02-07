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
    var genre_ids: [Int]
    var release_date: String
}

struct MovieDetail: Codable {
    var backdrop_path: String
    var title: String
    var genres: String
    var release_date: String
    
    init(backdrop_path: String, title: String, genres: String, release_date: String){
        self.backdrop_path = backdrop_path
        self.title = title
        self.genres = genres
        self.release_date = release_date
    }
}
