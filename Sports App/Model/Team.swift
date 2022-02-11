//
//  Team.swift
//  Sports App
//
//  Created by mac on 2/8/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation

struct ListOfTeams : Codable {
    var teams : [Team]?
}

struct Team : Codable {
    
    var strTeam : String?
    var intFormedYear, strLeague, strStadium, strStadiumThumb, strDescriptionEN, strFacebook, strTwitter, strTeamBadge, strTeamJersey : String?
}
