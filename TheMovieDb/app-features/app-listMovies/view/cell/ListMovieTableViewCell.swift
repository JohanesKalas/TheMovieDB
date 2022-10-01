//
//  ListMovieTableViewCell.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import UIKit
import Kingfisher

class ListMovieTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovieLbl: UILabel!
    
    var data: ListMovie? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell() {
        titleMovieLbl.text = data?.name
        
        if let url = URL(string: data?.posterPath ?? "") {
            imageMovie.kf.setImage(with: url, placeholder: UIImage(named: "default-image"))
        } else {
            self.imageMovie.image = UIImage(named: "default-image")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ListMovieTableViewCell", bundle: nil)
    }
    
    static func identifier() -> String {
        return "ListMovieTableViewCell"
    }
}
