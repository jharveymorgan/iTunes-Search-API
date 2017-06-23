//
//  ViewController.swift
//  iTunes-Search-API
//
//  Created by Jordan Harvey-Morgan on 6/22/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

// MARK: - Delegates
//protocol SearchByDelegate: class {
//    func didTapSearchButton(_ searchButton: UIButton)
//}

class SearchByViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var isbnTextField: UITextField!
    
    //weak var searchDelegate: SearchByDelegate?
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    @IBAction func searchButtonTapped(_ sender: Any) {
        if checkFields() {
            print("proceed")
        } else {
            print("do not pass go")
        }
    }

    @IBAction func infoButtonTapped(_ sender: Any) {
        print("information button tapped")
    }
    
    // MARK: - Class Methods
    func checkFields() -> Bool {
        let titleEmpty = titleTextField.text?.isEmpty
        let authorEmpty = authorTextField.text?.isEmpty
        let isbnEmpty = isbnTextField.text?.isEmpty
        
        
        // if searching by one field, others should be empty
        if titleEmpty == false && (authorEmpty == false || isbnEmpty == false) {
            print("search by title error")
            presentAlert()
            return false
        }
        if authorEmpty == false && (titleEmpty == false || isbnEmpty == false) {
            print("search by author error")
            presentAlert()
            return false
        }
        if isbnEmpty == false && (authorEmpty == false || titleEmpty == false) {
            print("search by isbn error")
            presentAlert()
            return false
        }
        
        return true
    }

}//end class

// MARK: - AlertController
extension SearchByViewController {
    // alert to tell user to only search by one parameter
    func presentAlert() {
        let alert = UIAlertController(title: nil, message: "Please only search by one parameter at a time.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
}

