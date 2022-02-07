//
//  Movie.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 03/02/22.
//

import Foundation

struct Movie: Codable {
   
    var backdrop_path: String
    var original_title: String
    var popularity: Double
    var vote_average: Double
    var vote_count: Int
}
