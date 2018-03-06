//
//  NotificationModel.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/6/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation

class NotificationModel {
	var name: String
	var registrationId: String
	var deviceID: String
	var isActive: Bool
	var type: String
	
	init(token: String) {
		self.registrationId = token
		self.name =  UIDevice.current.name
		self.deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
		self.isActive = true
		self.type = "iOS"
	}
	
	func toDic() -> [String: Any] {
		var dic = [String:Any]()
		dic.updateValue(self.name, forKey: "name")
		dic.updateValue(self.registrationId, forKey: "registration_id")
		dic.updateValue(self.deviceID, forKey: "device_id")
		dic.updateValue(self.isActive, forKey: "active")
		dic.updateValue(self.type, forKey: "type")
		return dic
	}
}
