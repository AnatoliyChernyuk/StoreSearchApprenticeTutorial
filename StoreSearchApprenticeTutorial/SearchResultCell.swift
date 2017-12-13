//
//  SearchResultCell.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 11/27/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var downloadTask: URLSessionDownloadTask?

    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        selectedBackgroundView = selectedView
    }
    
    func configure(for searchResult: SearchResult) {
        nameLabel.text = searchResult.name
        nameLabel.adjustsFontForContentSizeCategory = true
        if searchResult.artistName.isEmpty {
            artistNameLabel.text = NSLocalizedString("Unknown", comment: "Unknown value for artistNameLabel.text")
        } else {
            artistNameLabel.text = String(format: "%@, (%@)", searchResult.artistName, searchResult.kindForDisplay())
            artistNameLabel.adjustsFontForContentSizeCategory = true
        }
        artworkImageView.image = UIImage(named: "Placeholder")
        if let smallURL = URL(string: searchResult.artworkSmallURL) {
            downloadTask = artworkImageView.loadImage(url: smallURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
    }
    

}
