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
    var genresDictionary: Dictionary<Int,String> = [:]
    var movieDetail: [MovieDetail] = []
    
    init(service: MovieService) {
        self.service = service
    }
    
    func attachView(view: MovieView) {
        movieView = view
    }
    
    func loadMovie(){
        self.loadGenres()
        
        service.loadMovie { (movie) in
            self.movieView?.fetchMovie(movie)
        }
        
        service.loadSimilarMovies { (similiarMovie) in
            for movie in similiarMovie.results{
                let movieView = MovieDetail(backdrop_path: movie.backdrop_path,
                                            title: movie.title,
                                            genres: self.genreResult(genreList: movie.genre_ids),
                                            release_date: self.dateFormatString(date: movie.release_date))
                
                self.movieDetail.append(movieView)
            }
            self.movieView?.fetchMovieSimilar(movieDetail: self.movieDetail)
        }
    }
    
    private func loadGenres() {
        service.loadGenreMovie { (genreMovie) in
            for movie in genreMovie.genres{
                self.genresDictionary.updateValue(movie.name, forKey: movie.id)
            }
        }
    }
    
    func setFavorite(favorite: Bool){
        if favorite {
            self.movieView?.favoriteUncheked()
        }else{
            self.movieView?.favoriteCheked()
        }
    }
    
    private func dateFormatString(date: String)-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: date)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date!)
        return year
    }
    
    private func genreResult(genreList: [Int])-> String {
        var result: String = ""
        for item in genreList{
            result += " " + genresDictionary[item]!
        }
        return result
    }
}
