//
//  CoreDataService.swift
//  Sports App
//
//  Created by Mohamed AMR on 2/9/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataService : DBManager
{
    
    
    static var viewContext : NSManagedObjectContext!
    static var appDelegate : AppDelegate!
    init ()
    {
        CoreDataService.appDelegate = UIApplication.shared.delegate as! AppDelegate
        CoreDataService.viewContext = CoreDataService.appDelegate.persistentContainer.viewContext
    }
    func add(_ favoriteLeague : FavoriteLeague)
    {
        let entity   = NSEntityDescription.entity(forEntityName: "FavoriteLeagues", in: CoreDataService.viewContext)
        let newFavoriteLeague = NSManagedObject(entity: entity!, insertInto: CoreDataService.viewContext)
        
        
        
        newFavoriteLeague.setValue(favoriteLeague.strLeague, forKey: "strLeague")
        newFavoriteLeague.setValue(favoriteLeague.strBadge , forKey: "strBadge")
        newFavoriteLeague.setValue(favoriteLeague.strYoutube, forKey: "strYoutube")
        newFavoriteLeague.setValue(favoriteLeague.isFavorite , forKey: "isFavorite")
        
        do
        {
            try CoreDataService.viewContext.save()
        }
        catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    func fetch() -> [NSManagedObject]
    {
        let f = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        var ret : [NSManagedObject] = []
        do
        {
            ret = try CoreDataService.viewContext.fetch(f)
        }
        catch let error
        {
            print(error.localizedDescription)
        }
        return ret
    }
    func erase(_ object : NSManagedObject)
    {
        CoreDataService.viewContext.delete(object)
        do
        {
            try CoreDataService.viewContext.save()
        }
        catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    func query(_ queryStr : String) -> NSManagedObject?
    {
        let req = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        req.predicate = NSPredicate(format: "strLeague == %@", queryStr ?? "")
        var ret : [NSManagedObject]?
        do
        {
            ret = try CoreDataService.viewContext.fetch(req)
        }
        catch let error
        {
            print(error.localizedDescription)
        }
        if ret?.count == 0
        {
            return nil
        }
        return ret?[0]
    }
}
