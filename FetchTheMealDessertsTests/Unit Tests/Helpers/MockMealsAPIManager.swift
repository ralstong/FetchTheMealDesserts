//
//  MockMealsAPIManager.swift
//  FetchTheMealDessertsTests
//
//  Created by Ralston Goes on 3/1/24.
//

@testable import FetchTheMealDesserts

// Mock Manager that returns a successful result based on the request type,
// or a failure if `forceFailure` is set to `true`
class MockMealsAPIManager: MealsAPIManageable {
    
    var forceFailure: Bool = false
    
    func loadMeals(_ requestType: MealsRequestType) async -> Result<[Meal], Error> {
        if forceFailure {
            return .failure(APIError.failedRequest("Forced failure"))
        } else {
            switch requestType {
            case .category:
                return .success(MockData.mealList)
            case .id:
                return .success([MockData.mealRecipe])
            }
        }
    }
}
