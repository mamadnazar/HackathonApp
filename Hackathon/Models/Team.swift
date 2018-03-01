

import Foundation
import  SwiftyJSON

struct  Team {
    var id: Int?
    var members: Members
    var name: String
    var project_name: String
    var room: String
    var rank: Int
    var public_votes: Int
    var jury_points: Int
    var feedback: String

    init() {
        id = 0
        members = Members()
        name = ""
        project_name = ""
        room = ""
        rank = 0
        public_votes = 0
        jury_points = 0
        feedback = ""
    }
    
    init(json: JSON) {
        id = json["id"].intValue
        members = Members(json: json["members"])
        name = json["name"].stringValue
        project_name = json["project_name"].stringValue
        room = json["room"].stringValue
        rank = json["rank"].intValue
        public_votes = json["public_votes"].intValue
        jury_points = json["jury_points"].intValue
        feedback = json["feedback"].stringValue
    }
    
}

struct Teams {
    var array: Array = Array<Team>()
    
    init() {
    }
    
    init (json: JSON) {
        let jsonArray: [JSON] = json.arrayValue
        for i in jsonArray {
            let temp = Team(json: i)
            array.append(temp)
        }
    }
}
    
