//
//  SearchResult.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 11/27/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import Foundation

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
        switch kind {
        case "album": return "Album"
        case "audiobook": return "Audio Book"
        case "book": return "Book"
        case "ebook": return "E-Book"
        case "feature-movie": return "Movie"
        case "music-video": return "Music Video"
        case "podcast": return "Podcast"
        case "software": return "App"
        case "song": return "Song"
        case "tv-episode": return "TV Episode"
        default: return kind
        }
    }
    
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}

func > (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedDescending
}
