//
//  MovieView.swift
//  DesafioMobile2You
//
//  Created by Leonado Paez on 05/02/22.
//

import Foundation

protocol MovieView: NSObjectProtocol {
    func fetchMovie(_ movie: Movie)
    func fetchMovieSimilar (similarMovie: SimilarMovie)
    func favoriteCheked()
    func favoriteUncheked()
}
