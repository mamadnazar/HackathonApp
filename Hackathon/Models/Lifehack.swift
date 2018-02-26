//
//  Lifehack.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/23/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Lifehack {
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
        link = json["link"].stringValue
        image_url = json["image_url"].stringValue
    }
}

struct Lifehacks {
    var array: Array = Array<Lifehack>()
    
    init() {}
    
    init(json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            array.append(Lifehack(json: i))
        }
    }
    
}
