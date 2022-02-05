
//  MovieCardTableViewCell.swift
//  DesafioMobile2You
//
//  Created by leonardo Paez on 03/02/22.


import UIKit

class MovieCardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ivCoverCell: UIImageView!
    @IBOutlet weak var lbNameCell: UILabel!
    @IBOutlet weak var lbAnoCell: UILabel!
    @IBOutlet weak var lbGenreCell: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
