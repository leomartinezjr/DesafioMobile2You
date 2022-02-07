//
//  GenreList.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 06/02/22.
//

import Foundation

struct GenreMovie: Codable {
    
    var genres: [MovieGenreList]
}

struct MovieGenreList: Codable {
    
    var id: Int
    var name: String
    
}
