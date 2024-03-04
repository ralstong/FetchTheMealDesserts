//
//  URLBuilderTests.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 3/1/24.
//

@testable import FetchTheMealDesserts
import XCTest

final class URLBuilderTests: XCTestCase {

    func testLookupByIDURLString() {
        let urlBuilder = URLBuilder(base: "https://www.testAPI.com/", id: "1234")
        let urlString = urlBuilder.lookupByIDURLString
        XCTAssertEqual(urlString, "https://www.testAPI.com/lookup.php?i=1234")
    }
    
    func testFilterByCategoryURLString() {
        let urlBuilder = URLBuilder(base: "https://www.testAPI.com/", category: "food")
        let urlString = urlBuilder.filterByCategoryURLString
        XCTAssertEqual(urlString, "https://www.testAPI.com/filter.php?c=food")
    }
}
