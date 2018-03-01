//
//  Schedule.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Schedule {
    var id: Int
    var title: String
    var description: String
    var location: String
    var start_time: String
    var end_time: String
    var color_hex: String
    
    init() {
        id = 0
        title = ""
        description = ""
        location = ""
        start_time = ""
        end_time = ""
        color_hex = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        location = json["location"].stringValue
        start_time = json["start_time"].stringValue
        end_time = json["end_time"].stringValue
        color_hex = json["color_hex"].stringValue
    }
}

struct Schedules {
    var array : Array = Array<Schedule>()
    
    init () {}
    
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Schedule(json: i)
            array.append(temp)
        }
    }
}
