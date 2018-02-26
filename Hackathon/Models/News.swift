//
//  News.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct News {
    var id: Int
    var title: String
    var body: String
    var image_url: String
    var updated_at: String
    
    init() {
        id = 0
        title = ""
        body = ""
        image_url = ""
        updated_at = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        body = json["body"].stringValue
        image_url = json["image_url"].stringValue
        updated_at = json["updated_at"].stringValue
    }
    
}

struct Newses {
    var array: Array = Array<News>()
    
    init() {}
    
    init(json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            array.append(News(json: i))
        }
    }
}
