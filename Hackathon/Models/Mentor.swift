//
//  Mentor.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Mentor {
    var id: Int
    var full_name: String
    var work_place: String
    var work_area: String
    var image_url: String
    var description: String
    var contacts: Contacts
    
    init() {
        id = 0
        full_name = ""
        work_place = ""
        work_area = ""
        image_url = ""
        description = ""
        contacts = Contacts.init()
    }
    
    init (json: JSON) {
        id = json["id"].intValue
        full_name = json["full_name"].stringValue
        work_place = json["work_place"].stringValue
        work_area = json["work_area"].stringValue
        image_url = json["image_url"].stringValue
        description = json["description"].stringValue
        contacts = Contacts.init(json: json["contacts"])
    }
}

struct Mentors {
    var array: Array = Array<Mentor>()
    
    init() {
    }
    
    init(json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Mentor(json: i)
            array.append(temp)
        }
    }
}

struct Contact {
    var id: Int
    var type: String
    var value: String
    
    init() {
        id = 0
        type = ""
        value = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        type = json["type"].stringValue
        value = json["value"].stringValue
    }
}
struct Contacts {
    var array: Array = Array<Contact>()
    
    init() {
    }
    
    init(json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Contact(json: i)
            array.append(temp)
        }
    }
}
