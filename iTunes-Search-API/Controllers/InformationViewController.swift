//
//  InformationViewController.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/26/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    // MARK: - Properties

    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func icons8Tapped(_ sender: Any) {
        let icons8Link = "https://icons8.com/"
        UIApplication.shared.open(URL(string: icons8Link)!, options: [:], completionHandler: nil)
    }
}
