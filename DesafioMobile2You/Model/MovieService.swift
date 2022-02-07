//
//  Service.swift
//  
//
//  Created by Leonardo Paez on 04/02/22.
//

import Foundation
import Alamofire


public class MovieService {
    
    func loadMovie( onComplete: @escaping (Movie)-> Void){

        let url = Constants.HttpRequestURl.base + Constants.HttpRequestURl.detailsMovie
    
        AF.request(url).response { (response) in
        guard let data = response.data,
              let movieResponse = try? JSONDecoder().decode(Movie.self, from: data) else {return}
        
            onComplete(movieResponse)
        }
    }
    
    func loadSimilarMovies(onComplete: @escaping (SimilarMovie)-> Void){
        
        let url = Constants.HttpRequestURl.base + Constants.HttpRequestURl.similarMovir
        
        AF.request(url).response{ (response) in
            switch response.result{
            case .success(_):
                guard let json = response.data,
                      let response = try? JSONDecoder().decode(SimilarMovie.self, from: json) else {return  print("error json")}
        
                onComplete(response)
            case .failure(_):
                print(response.response!.statusCode)
            }
        }
    }
    
    func loadGenreMovie(onComplete: @escaping (GenreMovie)-> Void){
        
        let url = Constants.HttpRequestURl.base + Constants.HttpRequestURl.listGenre
        
        AF.request(url).response{ (response) in
            switch response.result{
            case .success(_):
                guard let json = response.data,
                      let response = try? JSONDecoder().decode(GenreMovie.self, from: json) else {return  print("error json")}
               
        
                onComplete(response)
            case .failure(_):
                print(response.response!.statusCode)
              
            }
        }
    }
}
