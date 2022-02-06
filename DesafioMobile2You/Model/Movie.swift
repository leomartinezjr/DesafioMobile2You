//
//  Movie.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 03/02/22.
//

import Foundation

struct Movie: Codable {
   
    let backdrop_path: String
    let original_title: String
    let popularity: Double
    let vote_average: Double
    let vote_count: Int
}
