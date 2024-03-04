//
//  URLBuilder.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import Foundation

struct URLBuilder {
    let base: String
    var id: String = ""
    var category: String = ""

    private let lookupByID = "lookup.php?i="
    private let filterByCategory = "filter.php?c="

    var lookupByIDURLString: String {
        return base + lookupByID + id
    }

    var filterByCategoryURLString: String {
        return base + filterByCategory + category
    }
}
