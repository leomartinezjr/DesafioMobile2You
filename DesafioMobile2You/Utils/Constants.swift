//
//  Constants.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 04/02/22.
//

import Foundation


class Constants{
    
    private static let apiKey = "44b2feecd75f13e6272acfe7112c5747"
    
    struct HttpRequestURl {
        static let base: String = "https://api.themoviedb.org/3"
        static let movieId: Int = 268
        static let detailsMovie: String = "/movie/\(movieId)?api_key=\(apiKey)"
        static let similarMovir: String = "/movie/\(movieId)/similar?api_key=\(apiKey)"
        }
    
    struct ImageURlFormat {
        static let baseImageURL: String = "https://image.tmdb.org/t/p/w500"
        
    }
}
