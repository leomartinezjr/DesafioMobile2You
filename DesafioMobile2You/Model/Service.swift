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
        }
    }
    
    class func loadSimilarMovies(onComplete: @escaping (SimilarMovie)-> Void){
        
        let url = Constants.HttpRequestURl.base + Constants.HttpRequestURl.similarMovir
        
        AF.request(url).response{ (response) in
            switch response.result{
            case .success(_):
                guard let json = response.data,
                      let response = try? JSONDecoder().decode(SimilarMovie.self, from: json) else {return  print("error json")}
        
                onComplete(response)
            case .failure(_):
                switch response.response!.statusCode{
                case 401: break
                case 404:
                    print("Nao existe o filme")
                    break
                default:
                break
                }
            }
        }
    }
}

struct APIResponse: Decodable {
    
    let backdrop_path: String
    let original_title: String
    let popularity: Double
    let vote_average: Float
}
