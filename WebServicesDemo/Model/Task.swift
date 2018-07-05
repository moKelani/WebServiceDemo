//
//  Task.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 7/1/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit
import SwiftyJSON

class Task: NSObject {
    
    var id: Int
    var task: String
    var completed: Bool = false
    var created_at = ""
    init(id: Int = 0, title: String) {
        self.id = id
        self.task = title
    }
    init?(dict: [String : JSON]) {
        guard let id = dict["id"]?.toInt, let task = dict["task"]?.string else {
            return nil
        }
        
        self.id = id
        self.task = task
        self.completed = dict["completed"]?.toBool ?? false
        self.created_at = dict["created_at"]?.string ?? ""
    }
    

}
