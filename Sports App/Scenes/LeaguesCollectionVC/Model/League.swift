//
//  League.swift
//  Sports App
//
//  Created by mac on 2/2/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
struct League : Codable {
    
      //var idLeague: String?
      var strLeague: String?
      //var dateFirstEvent, strGender, strCountry, strWebsite: String?
//      var strFacebook: String?
//      var strTwitter, strYoutube, strDescriptionEN: String?
      var strBadge: String?
     
}

struct AllLeagues : Codable {
    var countrys : [League]?
}


