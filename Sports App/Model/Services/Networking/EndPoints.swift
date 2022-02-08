//
//  EndPoints.swift
//  Sports App
//
//  Created by mac on 2/2/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
enum EndPoint : String {
    case allSports = "all_sports.php"
    case allLeagues = "search_all_leagues.php?c=England"
    case allTeams = "search_all_teams.php"
    case upcomingEvents = "eventslast.php"
    case lastEvents     = "eventslast2.php"
    case events = "searchevents.php?e="
}
