//
//  ListGenreTableViewCell.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import UIKit

class ListGenreTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var titleGenreLbl: UILabel!
    
    var data: GenreMovie? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell() {
        titleGenreLbl.text = data?.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ListGenreTableViewCell", bundle: nil)
    }
    
    static func identifier() -> String {
        return "ListGenreTableViewCell"
    }
}
