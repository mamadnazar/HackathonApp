//
//  Rule.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Rule {
    var id: Int
    var title: String
    var description: String
    var link: String
    var image_url: String
    
    init() {
        id = 0
        title = ""
        description = ""
        link = ""
        image_url = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        link = json["website"].stringValue
        image_url = json["logo_url"].stringValue
    }
    
}

struct Rules {
    var array : Array = Array<Rule>()
    
    init () {}
    
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Rule(json: i)
            array.append(temp)
        }
    }
}
