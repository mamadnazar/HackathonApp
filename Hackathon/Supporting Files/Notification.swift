//
//  Notification.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/6/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import UserNotifications
import Firebase
import FirebaseInstanceID
import FirebaseMessaging


extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
	func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
		//if let refreshedToken = InstanceID.instanceID().token() {
			print("fcm token: \(fcmToken)")
			let model = NotificationModel(token: fcmToken)
			ServerManager.shared.registerFirebaseToken(model: model, {
				print("REFRESHED TOKEN1")
			})
	}
	

	@available(iOS 10.0, *)
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		if UIApplication.shared.applicationState == .active {
			print("active")
			completionHandler([.alert, .sound])
		}
		else {
			print("inactive")
			completionHandler([.alert, .badge, .sound])
		}
	}
	
	@available(iOS 10.0, *)
	func userNotificationCenter(_ center: UNUserNotificationCenter,
								didReceive response: UNNotificationResponse,
								withCompletionHandler completionHandler: @escaping () -> Void) {
		let userInfo = response.notification.request.content.userInfo

		completionHandler()
	}
	
	func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any],
					 fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

		completionHandler(UIBackgroundFetchResult.newData)
	}
	
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		if let refreshedToken = InstanceID.instanceID().token() {
			print("InstanceID token: \(refreshedToken)")
			let model = NotificationModel(token: refreshedToken)
			ServerManager.shared.registerFirebaseToken(model: model, {
				print("REFRESHED TOKEN2")
			})
			
		}
	}
	
}
