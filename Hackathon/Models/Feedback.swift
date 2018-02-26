//
//  Feedback.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Feedback {
    var feedback_text: String
    var contact: String
    var time_added: String
    
    init() {
        feedback_text = ""
        contact = ""
        time_added = ""
    }
    
    init (feedback_text: String, contact: String, time_added: String) {
        self.feedback_text = feedback_text
        self.contact = contact
        self.time_added = time_added
    }
    
    init(json:JSON) {
        feedback_text = json["feedback_text"].stringValue
        contact = json["contact"].stringValue
        time_added = json["time_added"].stringValue
    }
    
    func getDict() -> [String: Any] {
        return ["feedback_text": feedback_text, "contact": contact, "time_added": time_added]
    }
    
}

class Feedbacks: NSObject {
    var array: Array = Array<Feedback>()
    
    init(json : JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Feedback(json: i)
            array.append(temp)
        }
    }
}


