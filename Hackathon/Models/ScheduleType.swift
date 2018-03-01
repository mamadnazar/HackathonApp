//
//  ScheduleType.swift
//  Hackathon
//
//  Created by ITLabAdmin on 3/1/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ScheduleType {
    var date: String
    var events = Schedules()
    
    init() {
        date = ""
    }
    
    init(json: JSON) {
        date = json["date"].stringValue
        events = Schedules(json: json["events"])
    }
    
}

struct ScheduleTypes {
    var array: Array = Array<ScheduleType>()
    
    init() {}
    
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = ScheduleType(json: i)
            array.append(temp)
        }
    }
}


