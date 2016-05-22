//
//  AddMovieVC.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/18/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class AddMovieVC: UIViewController {
    
    
    
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDescription: UITextField!

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var addMovieBtn: UIButton!
    
    var movie: FavMovie!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    func downloadMovieDetails(completed: DownloadComplete) {
        if let title = movieTitle.text where title != "" {
            
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("FavMovie", inManagedObjectContext: context)!
            let movie = FavMovie(entity: entity, insertIntoManagedObjectContext: context)
            
            
            let titleForUrl = title.stringByReplacingOccurrencesOfString(" ", withString: "+")
            let omdbUrl = "\(OMDB_BASE)\(titleForUrl)\(OMDB_PARAMETERS))"
            let url = NSURL(string: omdbUrl)!
            Alamofire.request(.GET, url).responseJSON {
                response in
                let result = response.result
                
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    if let imdbPlot = dict["Plot"] as? String {
                        movie.plotDesc = imdbPlot
                    }
                    
                    if let imdbID = dict["imdbID"] as? String {
                        movie.link = "\(IMDB_BASE)\(imdbID)"
                    }
                }
                print(movie.link)
                print(movie.plotDesc)
            }
            let tmdbUrl = "\(TMDB_BASE)\(API_KEY)\(TMDB_PARAMETERS)\(titleForUrl)"
            let imgUrl = NSURL(string: tmdbUrl)!
            
            Alamofire.request(.GET, imgUrl).responseJSON {
                response in
                let result = response.result
                
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    if let results = dict["results"] as? [Dictionary<String, AnyObject>] {
                        print(results[0].debugDescription)
                        if let path = results[0]["poster_path"] as? String {
                            let imageUrl = "\(IMG_BASE)\(IMG_WIDTH_154)\(path)"
                            movie.imgUrl = imageUrl
                            
                            var img: UIImage!
                            let url = NSURL(string: imageUrl)!
                            if let data = NSData(contentsOfURL: url) {
                                img = UIImage(data: data)
                                self.movieImg.image = img
                                movie.setMovieImage(img)
                            }
                            
                            
                        }
                    }
                    
                }
                
            }
            
            
            
            movie.title = title
            movie.desc = movieDescription.text
            
            
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie")
            }
            
            
          
        }
    }
    
    @IBAction func backBtnPressed(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func getMoviePoster(sender: AnyObject) {
        downloadMovieDetails { () -> () in
            
           
        }
    }
    
    
    @IBAction func addMovie(sender: AnyObject!) {
        
   

        
    }
    
   
}
