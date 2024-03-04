//
//  MealListViewModelTests.swift
//  FetchTheMealDessertsTests
//
//  Created by Ralston Goes on 3/1/24.
//

import XCTest
@testable import FetchTheMealDesserts

class MealsListViewModelTests: XCTestCase {
    var viewModel: MealsListViewModel!
    var mealsAPIManager = MockMealsAPIManager()

    override func setUpWithError() throws {
        viewModel = MealsListViewModel(mealsAPIManager: mealsAPIManager)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.state, .loading)
    }

    func testLoadMealsSuccess() async {
        let expectation = expectation(description: "Data fetched and decoded successfully.")
        await viewModel.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.state, .data(MockData.mealList))
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }

    func testLoadMealsFailure() async {
        let expectation = expectation(description: "Data fetching failed.")
        mealsAPIManager.forceFailure = true
        await viewModel.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.state, .error)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
}
