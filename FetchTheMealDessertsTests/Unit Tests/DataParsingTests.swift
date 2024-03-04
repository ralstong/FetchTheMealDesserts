//
//  DataParsingTests.swift
//  FetchTheMealDessertsTests
//
//  Created by Ralston Goes on 3/1/24.
//

import XCTest
@testable import FetchTheMealDesserts

class DataParsingTests: XCTestCase {
    
    func testDecodingMealsResponse() {
        guard let url = Bundle.main.url(forResource: "MockMealsResponse", withExtension: "json") else {
            XCTFail("Could not find MockMealsResponse JSON file")
            return
        }
        guard let sampleMealsResponseJsonData: Data = NSData(contentsOf: url) as Data? else {
            XCTFail("Could not retrieve MockMealsResponse JSON data")
            return
        }
        
        guard let sampleMealsResponse = try? MealList.parseData(sampleMealsResponseJsonData) else {
            XCTFail("Could not decode MockMealsResponse JSON data")
            return
        }
        
        XCTAssertGreaterThan(sampleMealsResponse.count, 0)
        XCTAssertEqual(sampleMealsResponse.first?.name, "Apam balik")
        XCTAssertEqual(sampleMealsResponse.first?.id, "53049")
        XCTAssertEqual(sampleMealsResponse.first?.imageUrl, URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
    }

    func testDecodingMealRecipeResponse() {
        guard let url = Bundle.main.url(forResource: "MockMealRecipeResponse", withExtension: "json") else {
            XCTFail("Could not find MockMealRecipeResponse JSON file")
            return
        }
        guard let sampleMealsResponseJsonData: Data = NSData(contentsOf: url) as Data? else {
            XCTFail("Could not retrieve MockMealRecipeResponse JSON data")
            return
        }
        
        guard let sampleMealsResponse = try? MealList.parseData(sampleMealsResponseJsonData) else {
            XCTFail("Could not decode MockMealRecipeResponse JSON data")
            return
        }
        
        XCTAssertGreaterThan(sampleMealsResponse.count, 0)
        XCTAssertEqual(sampleMealsResponse.first?.id, "53049")
        XCTAssertEqual(sampleMealsResponse.first?.name, "Apam balik")
        XCTAssertNotNil(sampleMealsResponse.first?.instructions)
        XCTAssertEqual(sampleMealsResponse.first?.ingredients.count, 9)
        XCTAssertEqual(sampleMealsResponse.first?.measurements.count, 9)
    }
}
