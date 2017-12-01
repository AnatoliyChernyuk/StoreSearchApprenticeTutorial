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
            dataTask?.cancel()
            tableView.reloadData()
            
            searchResults = []
            hasSearched = true
            
            let url = iTunesURL(searchText: searchBar.text!)
            let session = URLSession.shared
            dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                //print("On the main thread? " + (Thread.current.isMainThread ? "Yes" : "No"))
                if let error = error as NSError?, error.code == -999 {
                    return //Seaarch was cancelled
                } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    if let data = data, let jsonDictionary = self.parse(json: data) {
                        self.searchResults = self.parse(dictionary: jsonDictionary)
                        self.searchResults.sort(by: <)
                        DispatchQueue.main.async {
                            self.isLoading = false
                            self.tableView.reloadData()
                        }
                        return
                    }
                    
                    
                } else {
                    print("Failure! \(response!)")
                }
                DispatchQueue.main.async {
                    self.hasSearched = false
                    self.isLoading = false
                    self.tableView.reloadData()
                    self.showNetworkError()
                }
            })
            dataTask?.resume()
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}




























