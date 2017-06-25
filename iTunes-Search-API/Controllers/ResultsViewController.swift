//
//  ResultsViewController.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/23/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // MARK: - Properties
    var searchParameter: String = ""
    var bookResults = [Book]()
    
    // MARK: - Subviews
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // search for book
        getBookResults()
    }
    
    // MARK: - Functions
    func getBookResults() {
        UserService.searchiTunesAPI(by: searchParameter) { (response) in
            // add results to the array of books
            for result in response {
                let book = Book()
                
//                guard let title = result["trackName"] as? String, let author = result["artistName"] as? String, let releaseDate = result["releaseDate"] as? String, let price = result["formattedPrice"] as? String, let link = result["artworkUrl60"] as? String, let id = result["trackId"] as? String else {
//                        print("error with guard statement")
//                        break
//                }
                
                // get book info, see about using guard statement
                if let title = result["trackName"] { book.title = title as! String }
                if let author = result["artistName"] { book.author = author as! String }
                if let releaseDate = result["releaseDate"] { book.releaseDate = releaseDate as! String }
                if let price = result["formattedPrice"] { book.price = price as! String }
                if let link = result["artworkUrl60"] { book.link = link as! String }
                if let id = result["trackId"] { book.id = id as! Int }
                
                self.bookResults.append(book)
            }
            
            // create array of books
            print(self.bookResults)
            print("\nDone with Network Request")
        }
    }
    
}

// MARK: - UITableViewDataSource
extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.resultsCell, for: indexPath)
        return cell
    }
}

