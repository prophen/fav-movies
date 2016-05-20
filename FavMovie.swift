//
//  FavMovie.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/17/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class FavMovie: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
}
