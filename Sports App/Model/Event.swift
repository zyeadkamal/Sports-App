//
//  Event.swift
//  Sports App
//
//  Created by mac on 2/8/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct AllEvents: Codable {
    var event: [Event]?
}

// MARK: - Event
struct Event: Codable {
    var idEvent: String?
    var idAPIfootball, strEvent, strEventAlternate, strFilename: String?
    var strSport, idLeague, strLeague, strSeason: String?
    var strHomeTeam, strAwayTeam, intHomeScore, intRound: String?
    var intAwayScore: String?
    var strTimestamp: String?
    var dateEvent: String?
    var strTime: String?
    var idHomeTeam, idAwayTeam: String?
    var strCountry: String?
    var strPostponed, strLocked: String?
}




