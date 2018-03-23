//
//  DataManager.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/5/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import UIKit
//import SwiftyJSON

class DataManager {
    
    //var uDefaults = UserDefaults.standard
    class var shared: DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
	
	func isVoted() -> Bool {
		return UserDefaults.standard.bool(forKey: "isVoted")
	}
	func setVote() {
		 UserDefaults.standard.set(true, forKey: "isVoted")
	}
    
    
}

