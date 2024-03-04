//
//  MealList.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import Foundation

struct MealList: Decodable {
    let meals: [Meal]
    
    static func parseData(_ data: Data) throws -> [Meal]? {
        guard let mealsList = try? JSONDecoder().decode(MealList.self, from: data) else {
            throw APIError.decodingFailed
        }
        return mealsList.meals
    }
}
