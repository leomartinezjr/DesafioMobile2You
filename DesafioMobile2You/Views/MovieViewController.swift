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
    
    @IBOutlet weak var tableView: UITableView!
    
    var movie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieApi.loadMovie { (movie) in
            self.lbTitle.text = movie.original_title
           
            let meme = Constants.ImageURlFormat.baseImageURL
            if let url = URL(string: String(meme + movie.backdrop_path)){
                self.ivCover.kf.setImage(with: url)
                
            }else{self.ivCover.image = nil}
        }
    }

}

extension MovieViewController: UITableViewDataSource{
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
  
    
    
    
}

