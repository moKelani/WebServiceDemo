//
//  String+Extensions.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 7/1/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
