//
//  Config.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 7/1/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

struct URLs {
    static let main = "http://elzohrytech.com/alamofire_demo/api/v1/"
    ///POST{email, password}
    static let login = main + "login"
    
    /// POST {name, email, password, password_confirmation}
    static let register = main + "register"
    /// GET {api_token, page, per_page}
    static let tasks = main + "tasks"
    ///POST {api_token, task}
    static let new_task = main + "task/create"
    ///POST {api_token, task_id}
    static let delete_task = main + "task/delete"
    
}
