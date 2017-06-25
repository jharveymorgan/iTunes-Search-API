//
//  String+Utility.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/23/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import Foundation

struct CreateParameter {
    static func correctParameter(parameter: String) -> String {
        var parameterString = ""
        
        for character in parameter.characters {
            if character == " " {
                parameterString.append("+")
            } else {
                parameterString.append(character)
            }
            
        }
        
        return parameterString
    }
}
