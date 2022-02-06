//
//  MovieViewController.swift
//  DesafioMobile2You
//
//  Created by Leonardo Paez on 03/02/22.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {

    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbLikes: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let likeMessage = " Likes"
    let viewMessage = " Views"
    
    var moviesList: [MovieList] = []
    var movie: Movie?
    let moviePresenter = MoviePresenter(service: MovieService())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviePresenter.attachView(view: self)
        moviePresenter.loadMovie()
    }
}

extension MovieViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCardTableViewCell
        
        let movie = moviesList[indexPath.row]
        cell.prepare(whith: movie)
        return cell
    }
    
}

extension MovieViewController: MovieView {
    func fetchMovieSimilar(similarMovie: SimilarMovie) {
        self.moviesList = similarMovie.results
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchMovie(_ movie: Movie) {
        self.lbTitle.text = movie.original_title
        self.lbLikes.setTitle(String(movie.popularity) + self.likeMessage, for: .normal)
        if let url = URL(string: String(Constants.ImageURlFormat.baseImageURL + movie.backdrop_path)){
            self.ivCover.kf.setImage(with: url)
        }
        else
        {self.ivCover.image = nil}
    }
}
