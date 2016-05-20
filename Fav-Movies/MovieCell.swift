//
//  MovieCell.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/18/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieLink: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieImg: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(movie: FavMovie) {
        movieTitle.text = movie.title
        movieImg.image = movie.getMovieImage()
        movieLink.text = movie.link
        movieDesc.text = movie.desc
    }
}
