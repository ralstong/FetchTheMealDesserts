//
//  MealRecipeViewModel.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 3/1/24.
//

import Foundation

final class MealRecipeViewModel: LoadableObject {
    typealias Output = Meal

    @Published private(set) var state: AppState<Output> = .loading

    private let id: String
    private let mealsAPIManager: MealsAPIManageable

    init(id: String, mealsAPIManager: MealsAPIManageable = MealsAPIManager.shared) {
        self.id = id
        self.mealsAPIManager = mealsAPIManager
    }

    // updates the state of the view based on the API response
    private func updateState(_ newState: AppState<Output>) {
        DispatchQueue.main.async { [unowned self] in
            self.state = newState
        }
    }

    // loads the recipe for a meal using the meal id
    func loadData() async {
        let result = await mealsAPIManager.loadMeals(.id(id))
        switch result {
        case .success(let meals):
            if let meal = meals.first {
                updateState(.data(meal))
            } else {
                updateState(.error)
            }
        case .failure:
            updateState(.error)
        }
    }

    // formats the measurement for each ingredient for display
    func measuredIngredient(for mealRecipe: Meal) -> [String] {
        return zip(mealRecipe.measurements, mealRecipe.ingredients)
            .map { $0 + " " + $1 }
    }
}
