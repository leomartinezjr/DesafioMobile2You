//
//  MovieViewModel.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 04/02/22.
//

import UIKit

class MoviePresenter{
    
    private let repository: MovieRepository
    var movieView: MovieView?
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func attachView(view: MovieView) {
        movieView = view
    }
    
    func loadMovie(){
        repository.loadMovie { (movie) in
            self.movieView?.fetchMovie(movie)
        }
    }
}
