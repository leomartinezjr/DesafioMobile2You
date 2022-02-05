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
    let vote_average: Float
    
    init (response: APIResponse){

        backdrop_path = response.backdrop_path
        original_title = response.original_title
        popularity = response.popularity
        vote_average = response.vote_average
        
    }
        
}
