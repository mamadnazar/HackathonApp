//
//  SponsorType.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//


import Foundation
import SwiftyJSON

struct SponsorType {
    var type: String
    var items = Sponsors()
    
    init() {
        type = ""
    }
    
    init(json: JSON) {
        type = json["type"].stringValue
        items = Sponsors(json: json["items"])
    }
    
}

struct SponsorTypes {
    var array: Array = Array<SponsorType>()
    
    init() {
        
    }
    
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = SponsorType(json: i)
            array.append(temp)
        }
    }
}

