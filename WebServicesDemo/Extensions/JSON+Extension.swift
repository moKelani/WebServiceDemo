//
//  JSON+Extension.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 7/2/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit
import SwiftyJSON

extension JSON {
    var toBool: Bool? {
        if let bool = self.bool {
            return bool
        }
        if let int = self.toInt {
            if int == 0 {
                return false
            } else if int == 1 {
                return true
            }
        }
        
        return nil
    }
    
    var toInt: Int? {
        if let int = self.int {
            return int
        }
        if let string = self.string, let int = Int(string) {
            return nil
        }
        
        return nil
    }
}
