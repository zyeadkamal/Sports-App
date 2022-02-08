//
//  ClubDetailsPresenter.swift
//  Sports App
//
//  Created by mac on 2/8/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation


protocol ClubDetailsPresenterProtocol {
    
    func getClubDetails() -> Team
    
}


class ClubDetailsPresenter : ClubDetailsPresenterProtocol {
   
    var club : Team
    
    init(club : Team) {
        self.club = club
    }
    
    func getClubDetails() -> Team{
        return club
       }
    
}
