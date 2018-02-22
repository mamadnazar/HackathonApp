//
//  FAQ.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct FAQ {
    var id: Int
    var question: String
    var answer: String
    
    init() {
        id = 0
        question = ""
        answer = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        question = json["question"].stringValue
        answer = json["answer"].stringValue
    }
    
}

struct FAQs {
 
    var array: Array = Array<FAQ>()
    
    init() {}
    
    init(json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            array.append(FAQ(json: i))
        }
    }
}
