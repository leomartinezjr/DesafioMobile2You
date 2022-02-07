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
    @IBOutlet weak var lbLikes: UILabel!
    @IBOutlet weak var lbPopularity: UILabel!
    @IBOutlet weak var btHeart: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let likeMessage = " Likes"
    let viewMessage = " Popularity"
    
    var movieDetail: [MovieDetail] = []
    var movie: Movie?
    let moviePresenter = MoviePresenter(service: MovieService())
    var favoriteStatus: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviePresenter.attachView(view: self)
        moviePresenter.loadMovie()
    }
    
    @IBAction func btHeart(_ sender: Any) {
        moviePresenter.setFavorite(favorite: favoriteStatus)
    }
}

extension MovieViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCardTableViewCell
        
        let movie = movieDetail[indexPath.row]
        cell.prepare(whith: movie)
        return cell
    }
}

extension MovieViewController: MovieView {
    func favoriteCheked() {
        self.favoriteStatus = true
        btHeart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    func favoriteUncheked() {
        self.favoriteStatus = false
        btHeart.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    func fetchMovieSimilar(movieDetail: [MovieDetail]) {
        self.movieDetail = movieDetail
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchMovie(_ movie: Movie) {
        
        self.lbTitle.text = movie.original_title
        self.lbLikes.text = String(movie.vote_count) + likeMessage
      
        self.lbPopularity.text = String(movie.popularity) + viewMessage
        
        if let url = URL(string: String(Constants.ImageURlFormat.baseImageURL + movie.backdrop_path)){
            self.ivCover.kf.setImage(with: url)
        }
        else
        {self.ivCover.image = nil}
    }
    
    func fetchGenreMovie(genreMovie: GenreMovie){
        
    }
}
