//
//  AppDelegate.swift
//  save_data_local
//
//  Created by raiu on 2019/11/08.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = UserDefaults.standard
        var dic = ["firstLaunch": true]
        defaults.register(defaults: dic)
          
        // Some Process will be here
        if defaults.bool(forKey: "firstLaunch") {
          
            // Some Process will be here
            let directory_path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
            let fileManager = FileManager.default
            do {
                try fileManager.createDirectory(atPath: directory_path, withIntermediateDirectories: true, attributes: nil)
                print("Created directory")
            } catch {
                print("failed")
            }
            // off the flag to know if it is first time to launch
            defaults.set(false, forKey: "firstLaunch")
        }
        
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


}

