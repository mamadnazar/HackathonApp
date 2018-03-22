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
    
    func getAboutHacks(_ completion: @escaping (AboutHacks)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/about", completion: { (json) in
            completion(AboutHacks(json: json))
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
    
    func getMentorByID(mentorID: Int,_ completion: @escaping (Mentor)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/people/\(mentorID)", completion: { (json) in
            completion(Mentor(json: json))
        }, error: error)
    }
    
    func getFAQs(_ completion: @escaping (FAQs)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/faq", completion: { (json) in
            completion(FAQs(json: json))
        }, error: error)
    }
    
    func getNewses(_ completion: @escaping (Newses)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "updates/news", completion: { (json) in
            completion(Newses(json: json["results"]))
        }, error: error)
    }
    
    func getLifehacks(_ completion: @escaping (Lifehacks)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/lifehacks", completion: { (json) in
            completion(Lifehacks(json: json))
        }, error: error)
    }
    
    func getRules(_ completion: @escaping (Rules)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "info/rules", completion: { (json) in
            completion(Rules(json: json))
        }, error: error)
    }
    
    func addFeedbacks(feedback: Feedback,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: "feedback/", parameters: feedback.getDict(), header: [:], completion: { (json) in
            completion()
        }) { (message) in
            print(message)
        }
    }
    
    func getScheduleTypes(_ completion: @escaping (ScheduleTypes)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "updates/getSchedule", completion: { (json) in
            completion(ScheduleTypes(json: json))
        }, error: error)
    }
            
    func getTeams(_ completion: @escaping (Teams)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "participants/teams/", completion: { (json) in
            completion(Teams(json: json))
        }, error: error)
    }
	func registerFirebaseToken(model: NotificationModel, _ completion: @escaping ()-> Void) {
        self.post(api: "fcm/devices/", parameters: model.toDic(), header: [:], completion: { (json) in
			completion()
		}) { (error) in }
	}
	
	func getVotingStatus(_ completion: @escaping (String)-> Void, error: @escaping (String)-> Void) {
		self.get(api: "vote/status", completion: { (json) in
			completion(json["status"].stringValue)
		}, error: error)
	}
	
    func checkQR(qr: String,_ completion: @escaping (Teams)-> Void, error: @escaping (String)-> Void) {
        self.post(api: "vote/", parameters: [:], header: ["QR": qr, "IMEI": "31213213"], completion: { (json) in
            let teams = Teams(json: json)
            completion(teams) 
        }, error: error)
    }
    func voteForTeam(qr: String, imei: String, teamId: Int,_ completion: @escaping (String)-> Void, error: @escaping (String)-> Void) {
        self.post(api: "vote/", parameters: ["team": teamId], header: ["QR": qr, "IMEI": imei], completion: { (json) in
            let status = json["status"].stringValue
            completion(status)
        }, error: error)
    }
//    func getTeams(_ completion: @escaping (Teams)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "participants/teams", completion: { (json) in
//            completion(Teams(json: json))
//        }, error: error)
//    }
    
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

