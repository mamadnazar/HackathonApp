//
//  ServerManager.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/5/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
//import Alamofire
//import SwiftyJSON

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    
    func getAboutHack(_ completion: @escaping (AboutHack)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/about/1", completion: { (json) in
            completion(AboutHack(json: json))
        }, error: error)
    }
    
    func getSponsors(_ completion: @escaping (SponsorTypes)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/companies", completion: { (json) in
            completion(SponsorTypes(json: json))
        }, error: error)
    }
  
    func getMentors(_ completion: @escaping (MentorTypes)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/people", completion: { (json) in
            completion(MentorTypes(json: json))
        }, error: error)
    }
    
// Commented lines below are kind of a template
//    func getAboutApp(_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "info/about", completion: { (json) in
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

