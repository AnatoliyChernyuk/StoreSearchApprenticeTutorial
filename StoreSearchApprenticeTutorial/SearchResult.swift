//
//  SearchResult.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 11/27/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import Foundation

private let displayNamesForKind = [
"album": NSLocalizedString("Album", comment: "Localized kind: Album"),
"audiobook": NSLocalizedString("Audio Book", comment: "Localized kind: Audio Book"),
"book": NSLocalizedString("Book", comment: "Localized kind: Book"),
"ebook": NSLocalizedString("E-Book", comment: "Localized kind: E-Book"),
"feature-movie": NSLocalizedString("Movie", comment: "Localized kind: Movie"),
"music-video": NSLocalizedString("Music Video", comment: "Localized kind: Music Video"),
"podcast": NSLocalizedString("Podcast", comment: "Localized kind: Podcast"),
"software": NSLocalizedString("App", comment: "Localized kind: App"),
"song": NSLocalizedString("Song", comment: "Localized kind: Song"),
"tv-episode": NSLocalizedString("TV Episode", comment: "Localized kind: TV Episode")
]

class SearchResult {
    var artistName = ""
    var artworkLargeURL = ""
    var artworkSmallURL = ""
    var currency = ""
    var genre = ""
    var kind = ""
    var name = ""
    var price = 0.0
    var storeURL = ""
    
    func kindForDisplay() -> String {
        return displayNamesForKind[kind] ?? kind
    }
    
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}

func > (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedDescending
}
