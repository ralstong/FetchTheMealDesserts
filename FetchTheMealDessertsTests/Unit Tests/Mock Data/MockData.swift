//
//  MockData.swift
//  FetchTheMealDessertsTests
//
//  Created by Ralston Goes on 3/1/24.
//

@testable import FetchTheMealDesserts
import Foundation

enum MockData {
    static let mealList: [Meal] = [.init(name: "Red Velvet Cake",
                                         imageUrl: URL(string: "https://wwww.mealsAPI.com/redvelvet.png"), id: "123456",
                                         instructions: "Instructions to make red velvet cake",
                                         ingredients: ["love", "flour"],
                                         measurements: ["a lot of", "1 cup"]),
                                   .init(name: "Chocolate Cake",
                                         imageUrl: URL(string: "https://wwww.mealsAPI.com/redvelvet.png"), id: "75847",
                                         instructions: "Instructions to make chocolate cake",
                                         ingredients: ["love", "flour"],
                                         measurements: ["a lot of", "1 cup"])].sorted(by: { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending })

    static let mealRecipe: Meal = .init(name: "Red Velvet Cake",
                                        imageUrl: URL(string: "https://wwww.mealsAPI.com/redvelvet.png"), id: "123456",
                                        instructions: "Instructions to make red velvet cake",
                                        ingredients: ["love", "flour"],
                                        measurements: ["a lot of", "1 cup"])

    static let mealId = "testId"
}
