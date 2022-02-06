//
//  MovieViewModel.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 04/02/22.
//

import UIKit

class MoviePresenter{
    
    private let service: MovieService
    var movieView: MovieView?
    
    init(service: MovieService) {
        self.service = service
    }
    
    func attachView(view: MovieView) {
        movieView = view
    }
    
    func loadMovie(){
        service.loadMovie { (movie) in
            self.movieView?.fetchMovie(movie)
        }
        
        service.loadSimilarMovies { (similiarMovie) in
            self.movieView?.fetchMovieSimilar(similarMovie: similiarMovie)
        }
    }
    
    func setFavorite(favorite: Bool){
        if favorite {
            self.movieView?.favoriteUncheked()
        }else{
            self.movieView?.favoriteCheked()
        }
    }
}
