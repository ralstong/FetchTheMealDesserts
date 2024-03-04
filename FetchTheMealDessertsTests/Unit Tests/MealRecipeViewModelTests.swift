//
//  MealRecipeViewModelTests.swift
//  FetchTheMealDessertsTests
//
//  Created by Ralston Goes on 3/1/24.
//

@testable import FetchTheMealDesserts
import XCTest

class MealRecipeViewModelTests: XCTestCase {
    var viewModel: MealRecipeViewModel!
    var mealsAPIManager = MockMealsAPIManager()

    override func setUpWithError() throws {
        viewModel = MealRecipeViewModel(id: MockData.mealId, mealsAPIManager: mealsAPIManager)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.state, .loading)
    }

    func testLoadMealsSuccess() async {
        await viewModel.loadData()
        let expectation = expectation(description: "Data fetched and decoded successfully.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.state, .data(MockData.mealRecipe))
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }

    func testLoadMealsFailure() async {
        mealsAPIManager.forceFailure = true
        await viewModel.loadData()
        let expectation = expectation(description: "Data fetching failed.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.state, .error)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
}
