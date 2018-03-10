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
		self.type = "ios"
	}
	
	func toDic() -> [String: Any] {
		let dic = ["name" : name,
				   "device_id": deviceID,
				   "registration_id" : registrationId,
				   "active": true,
				   "type": "ios"] as [String : Any]
		return dic
	}
}
