//
//  Service.swift
//  
//
//  Created by Leonardo Paez on 04/02/22.
//

import Foundation
import Alamofire


public final class MovieApi:NSObject {
    
    
    class func loadMovie( onComplete: @escaping (Movie)-> Void){

    let url = Constants.HttpRequestURl.base + Constants.HttpRequestURl.detailsMovie
    AF.request(url).response { (response) in
        guard let data = response.data,
              let response = try? JSONDecoder().decode(APIResponse.self, from: data) else {return}
        let movie = Movie(response: response)
        onComplete(movie)
        print(movie.original_title) 
        
                
        }
    }
}

struct APIResponse: Decodable {
    
    let backdrop_path: String
    let original_title: String
    let popularity: Double
    let vote_average: Float
}
