//
//  MentorType.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MentorType {
    var type: String
    var items = Mentors()
    
    init() {
        type = ""
    }
    
    init(json: JSON) {
        type = json["type"].stringValue
        items = Mentors(json: json["items"])
    }
}

struct MentorTypes {
    var array: Array = Array<MentorType>()
    
    init() {
    }
    
    init (json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = MentorType(json: i)
            array.append(temp)
        }
    }
}
