//
//  File.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/23/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import Foundation
import SwiftyJSON

class Book {
    var title: String
    var author: String
    var releaseDate: String
    var price: String
    var link: String
    var id: Int
    
    
    init(json: JSON) {
        self.title = json["trackName"].stringValue
        self.author = json["artistName"].stringValue
        self.releaseDate = json["releaseDate"].stringValue
        self.price = json["formattedPrice"].stringValue
        self.link = json["trackViewUrl"].stringValue
        self.id = json["trackId"].intValue
    }
    
    init(title: String, author: String, releaseDate: String, price: String, link: String, id: Int) {
        self.title = title
        self.author = author
        self.releaseDate = releaseDate
        self.price = price
        self.link = link
        self.id = id
    }
    
    init() {
        self.title = ""
        self.author = ""
        self.releaseDate = ""
        self.price = ""
        self.link = ""
        self.id = 0
    }
}
