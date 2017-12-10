//
//  ViewController.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 11/27/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    struct TableViewCellIdentifiers {
        static let searchResultCell = "SearchResultCell"
        static let nothingFoundCell = "NothingFoundCell"
        static let loadingCell = "LoadingCell"
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var landscapeViewController: LandscapeViewController?
    var search = Search()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 108, left: 0, bottom: 0, right: 0)
        var cellNib = UINib(nibName: TableViewCellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.searchResultCell)
        tableView.rowHeight = UITableViewAutomaticDimension
        
        cellNib = UINib(nibName: TableViewCellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.nothingFoundCell)
        searchBar.becomeFirstResponder()
        
        cellNib = UINib(nibName: TableViewCellIdentifiers.loadingCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.loadingCell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        switch newCollection.verticalSizeClass {
        case .compact:
            showLandscape(with: coordinator)
        case .regular, .unspecified:
            hideLandscape(with: coordinator)
        }
    }
    

    
    func performSearch() {
        search.performSearch(for: searchBar.text!, category: segmentedControl.selectedSegmentIndex, completion: {
            success in
            if !success {
                self.showNetworkError()
            }
            self.tableView.reloadData()
        })
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    private func showNetworkError() {
        let alert = UIAlertController(title: "Whoops...", message: "There was an error reading from the iTunes Store. Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func showLandscape(with coordinator: UIViewControllerTransitionCoordinator) {
        guard landscapeViewController == nil else {return}
        landscapeViewController = (storyboard!.instantiateViewController(withIdentifier: "LandscapeViewController") as! LandscapeViewController)
        if let controller = landscapeViewController {
            controller.search = search
            controller.view.frame = view.bounds
            controller.view.alpha = 0
            searchBar.resignFirstResponder()
            view.addSubview(controller.view)
            addChildViewController(controller)
            coordinator.animate(alongsideTransition: {_ in controller.view.alpha = 1}, completion: { _ in
                controller.didMove(toParentViewController: self)
                if self.presentedViewController != nil {
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    private func hideLandscape(with coordinator: UIViewControllerTransitionCoordinator) {
        if let controller = landscapeViewController {
            controller.willMove(toParentViewController: nil)
            coordinator.animate(alongsideTransition: { _ in
                controller.view.alpha = 0
                if !self.search.hasSearched {
                    self.searchBar.becomeFirstResponder()
                }
            }, completion: { _ in
                controller.view.removeFromSuperview()
                controller.removeFromParentViewController()
                self.landscapeViewController = nil
            })
        }
    }
    
    //MARK: Actions
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        performSearch()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail", let indexPath = sender as? IndexPath {
            let controller = segue.destination as! DetailViewController
            let searchItem = search.searchResults[indexPath.row]
            controller.searchResult = searchItem
        }
    }
}






































