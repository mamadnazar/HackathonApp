//
//  Member.swift
//  Hackathon
//
//  Created by ITLabAdmin on 3/1/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Member {
    var id: Int?
    var type: String?
    var full_name: String?
    var team: Int?

    init(json: JSON) {
        id = json["id"].intValue
        type = json["type"].stringValue
        full_name = json["full_name"].stringValue
        team = json["team"].intValue
    
    }
}

class Members {
    var array : Array = Array<Member>()
    init() {
        
    }
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let tem = Member(json: i)
            array.append(tem)
        }
    }
}

        
    

