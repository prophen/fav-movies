//
//  MoviesDetailVC.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/20/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class MoviesDetailVC: UIViewController {
    
    var movie: FavMovie!
    @IBOutlet weak var nameLbl: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = movie.title
    }


    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
