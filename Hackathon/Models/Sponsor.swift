//
//  Sponsor.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Sponsor {
    var id: Int
    var title: String
    var description: String
    var website: String
    var logo_url: String
    
    init() {
        id = 0
        title = ""
        description = ""
        website = ""
        logo_url = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        website = json["website"].stringValue
        logo_url = json["logo_url"].stringValue
    }
    
}

class Sponsors {
    var array : Array = Array<Sponsor>()
    
    init () {
        
    }
    
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Sponsor(json: i)
            array.append(temp)
        }
    }
}
