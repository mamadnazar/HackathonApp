//
//  ServerManager.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/5/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    

// Commented lines below are kind of a template
//    func getAllStories(_ completion: @escaping (Stories)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "stories", completion: { (json) in
//            completion(Stories(json: json))
//        }, error: error)
//    }
//
//    func addStories(story: Story,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
//        self.post(api: "stories/", parameters: story.getDict(), completion: { (json) in
//            completion()
//        }) { (message) in
//            print(message)
//        }
//    }
//
//    func getInstitutesById(id: Int, _ completion: @escaping (Institutes)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "servicesByCat/\(id)/", completion: { (json) in
//            completion(Institutes(json: json))
//        }, error: error)
//    }

}

