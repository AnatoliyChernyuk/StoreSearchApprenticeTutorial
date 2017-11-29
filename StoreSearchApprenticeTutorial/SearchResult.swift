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
    
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}
