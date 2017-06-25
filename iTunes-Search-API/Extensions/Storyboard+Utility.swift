//
//  Storyboard+Utility.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/23/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum ISType: String {
        case SearchResults
        
        var filename: String {
            return rawValue
        }
    }
    
    convenience init(type: ISType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    // get initial view controller of a specific storyboard
    static func initialViewController(for type: ISType) -> UIViewController{
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
}
