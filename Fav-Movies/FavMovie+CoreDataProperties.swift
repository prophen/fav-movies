//
//  FavMovie+CoreDataProperties.swift
//  
//
//  Created by Nikema Prophet on 5/21/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavMovie {

    @NSManaged var desc: String?
    @NSManaged var image: NSData?
    @NSManaged var link: String?
    @NSManaged var plotDesc: String?
    @NSManaged var title: String?
    @NSManaged var imgUrl: String?

}
