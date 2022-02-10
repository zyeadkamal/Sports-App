//
//  DBManager.swift
//  Sports App
//
//  Created by Mohamed AMR on 2/9/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
import CoreData

protocol DBManager
{
    func add(_ favoriteLeague : FavoriteLeague)
    func erase(_ object : NSManagedObject)
    func fetch() -> [NSManagedObject]
    func query(_ queryStr : String) -> NSManagedObject?
}
