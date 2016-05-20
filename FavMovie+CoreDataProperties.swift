//
//  FavMovie+CoreDataProperties.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/17/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavMovie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var plotDesc: String?
    @NSManaged var link: String?
    @NSManaged var desc: String?

}
