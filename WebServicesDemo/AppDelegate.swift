//
//  AppDelegate.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 6/30/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        if let api_token = Helper.getApiToken() {
            print("apiToken: \(api_token)")
            let MainTabViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
            window?.rootViewController = MainTabViewController
        }

        return true
    }



}

