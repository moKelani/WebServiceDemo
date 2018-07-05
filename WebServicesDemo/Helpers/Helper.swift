//
//  Helper.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 7/1/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func restartApp() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var viewController: UIViewController
        if getApiToken() == nil {
            // go to auth screen
            viewController = storyBoard.instantiateInitialViewController()!
        } else {
            // go to MainTabViewController
            viewController = storyBoard.instantiateViewController(withIdentifier: "main")
        }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        
        
    }
    class func saveApiToken(token: String) {
        /// save api token to UserDefaults
        let user = UserDefaults.standard
        user.set(token, forKey: "api_token")
        user.synchronize()
        
        restartApp()
    }
    
    class func getApiToken() -> String? {
        
        let user = UserDefaults.standard
        return user.object(forKey: "api_token") as? String
        
    }
    
}
