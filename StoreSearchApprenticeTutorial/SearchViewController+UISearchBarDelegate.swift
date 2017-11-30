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
            isLoading = true
            tableView.reloadData()
            
            searchResults = []
            hasSearched = true
            
            let queue = DispatchQueue.global()
            queue.async {
                let url = self.iTunesURL(searchText: searchBar.text!)
                if let jsonString = self.performStoreRequest(with: url), let jsonDictionary = self.parse(json: jsonString) {
                    self.searchResults = self.parse(dictionary: jsonDictionary)
                    self.searchResults.sort(by: <)
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.tableView.reloadData()
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.showNetworkError()
                }
            }
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
