//
//  AboutHack.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import SwiftyJSON
 
struct AboutHack {
    var id: Int
    var title: String
    var image_url: String
    var description: String
    var link: String
    
    init() {
        id = 0
        title = ""
        image_url = ""
        description = ""
        link = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        image_url = json["image_url"].stringValue
        description = json["description"].stringValue
        link = json["link"].stringValue
        
    }
}

//struct AboutHacks {
//    
//    var array: Array = Array<AboutHack>()
//    
//    init() {}
//    
//    init(json: JSON) {
//        let jsonArray: [JSON] = json.arrayValue
//        for i in jsonArray {
//            array.append(AboutHack(json: i))
//        }
//    }
//}




