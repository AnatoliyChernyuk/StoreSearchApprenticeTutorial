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
        searchBar.resignFirstResponder()
        searchResults = []
        hasSearched = true
        if searchBar.text! != "Justin Bieber" {
            for i in 0...2 {
                let searchResult = SearchResult()
                searchResult.name = String(format: "Fake result %d for", i)
                searchResult.artistName = searchBar.text!
                searchResults.append(searchResult)
            }
        }
        
        tableView.reloadData()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
