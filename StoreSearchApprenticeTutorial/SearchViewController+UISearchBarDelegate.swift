//
//  File.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 11/27/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            searchResults = []
            hasSearched = true
            
            let url = iTunesURL(searchText: searchBar.text!)
            print("URL: '\(url)'")
            if let jsonString = performStoreRequest(with: url) {
                //print("Received JSON string '\(jsonString)'")
                if let jsonDictionary = parse(json: jsonString) {
                    //print("Dictionary \(jsonDictionary)")
                    searchResults = parse(dictionary: jsonDictionary)
                    searchResults.sort(by: <)
                    tableView.reloadData()
                    return
                }
            }
            showNetworkError()
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
