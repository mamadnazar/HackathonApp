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
		let tempDate = json["updated_at"].stringValue
		let start = String.Index(encodedOffset: 0)
		let end = String.Index(encodedOffset: 16)
		let newDate = String(tempDate[start..<end])
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
		let date = dateFormatter.date(from: newDate)!
		dateFormatter.locale = Locale(identifier: "ru_RU")
		dateFormatter.dateFormat = "dd MMMM yyyy, HH:mm"
		updated_at = dateFormatter.string(from: date)
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
