//
//  AppDelegate.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/21.
//

import UIKit
import RealmSwift
import UserNotifications

@main

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = RealmSwift.Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: nil,
            deleteRealmIfMigrationNeeded: true)
        
        Realm.Configuration.defaultConfiguration = config
        
        return true
        
    }
        
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted: Bool, error: Error?) in
            print("許可されたか: \(granted)")
        }
        
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHanndler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(
            [
                UNNotificationPresentationOptions.banner,
                UNNotificationPresentationOptions.list,
                UNNotificationPresentationOptions.sound,
                UNNotificationPresentationOptions.badge
            ]
        )
        
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceiver response: UNNotificationResponse, withcCompletionHandler completionHandler: @escaping () -> Void) {
            completionHandler()
        }
        
    }
    

