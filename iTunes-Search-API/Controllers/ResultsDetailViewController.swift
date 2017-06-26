//
//  ResultsDetailViewController.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/26/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit
import Kingfisher

class ResultsDetailViewController: UIViewController {
    // MARK: - Properties
    var book = Book()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var buyButton: UIButton!
    
    let timestampFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter
    }()
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show all book information
        configureBookDetail(book: book)
    }
    
    // MARK: - IBActions
    @IBAction func didTapBuyBook(_ sender: Any) {
        let bookLink = createAffiliateLink(for: book.id)
        UIApplication.shared.open(URL(string: bookLink)!, options: [:], completionHandler: nil)
    }
    
    // MARK: - Function(s)
    // display information
    func configureBookDetail(book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        releaseDateLabel.text = timestampFormatter.string(from: book.correctDate)
        priceLabel.text = book.price
        
        let coverURL = URL(string: book.link)
        coverImage.kf.setImage(with: coverURL)
    }
    
    // construct the affiliate link
    func createAffiliateLink(for bookID: Int) -> String {
        let affiliateLink = "https://geo.itunes.apple.com/us/book/id\(bookID)?mt=11&at=\(Constants.iTunesAffiliate.affiliateID)"
        return affiliateLink
    }
}
