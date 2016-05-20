//
//  AddMovieVC.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/18/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDescription: UITextField!
    @IBOutlet weak var movieLink: UITextField!
    @IBOutlet weak var plotDescription: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var addMovieBtn: UIButton!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func backBtnPressed(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func addMovie(sender: AnyObject!) {
        if let title = movieTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("FavMovie", inManagedObjectContext: context)!
            let movie = FavMovie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = title
            movie.desc = movieDescription.text
            movie.link = movieLink.text
            movie.plotDesc = plotDescription.text
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie")
            }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
   
}
