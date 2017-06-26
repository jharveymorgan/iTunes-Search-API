//
//  Constants.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/23/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import Foundation

struct Constants {
    // Segues
    struct Segue {
        static let showResults = "showResults"
        static let showResultDetail = "showResultDetail"
        static let showInfo = "showInfo"
    }
    
    // Cells
    struct TableViewCell {
        static let resultsCell = "resultsCell"
    }
    
    // Search Parameters
    struct SearchParameters {
        static let title = "title"
        static let author = "author"
        static let isbn = "isbn"
    }
    
    // Affiliate LInk
    struct iTunesAffiliate {
        static let affiliateID = "1001lxxD"
    }
    
    // Errors
    enum SearchError: Error {
        case invalidSearchParameters
        case NoSearchParameters
    }
}
