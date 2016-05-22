//
//  ViewController.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/17/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [FavMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FavMovie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [FavMovie]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var movie: FavMovie!
        
        movie = movies[indexPath.row]

        performSegueWithIdentifier("MoviesDetailVC", sender: movie)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return  movies.count

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MoviesDetailVC" {
            if let detailsVC =  segue.destinationViewController as? MoviesDetailVC {
                if let movie = sender as? FavMovie {
                    detailsVC.movie = movie
                }
            }
        }
    }

 


}

