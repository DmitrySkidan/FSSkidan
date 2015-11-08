//
//  SearchTableViewController.swift
//  fs
//
//  Created by Mac on 08.11.15.
//  Copyright © 2015 MyApp. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController {
    
    var searchValue: String!
    
    @IBOutlet weak var searchField: UITextField!
    @IBAction func searchButtonTapped(sender: AnyObject) {
        searchValue = searchField.text
        performSegueWithIdentifier("showSearchResult", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! SearchResultTableViewController;
        destViewController.receivedSearchValue = searchValue
        segue.destinationViewController.hidesBottomBarWhenPushed = true;
    }
}
