//
//  UserServices.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/23/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct UserService {
    
    static func searchiTunesAPI(by userParameter: String, completion: @escaping (Array<Dictionary<String, Any>>) -> Void) {
        // iTunes search api
        let apiToContact = "https://itunes.apple.com/search"
        
        // initial parameters array
        let parameters: Parameters = ["term": userParameter, "media": "ebook", "limit": "10"]
        
        // Alamofire request
        Alamofire.request(apiToContact, parameters: parameters).validate().responseJSON() { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    
                    let results = value as! Dictionary<String, Any>
                    
                    guard let finalResults = results["results"] as? Array<Dictionary<String, Any>> else { return completion([[:]]) }
                    
                    completion(finalResults)
                }
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
}
