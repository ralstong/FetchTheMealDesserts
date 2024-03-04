//
//  MealsListViewModel.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import Foundation

final class MealsListViewModel: LoadableObject {
    typealias Output = [Meal]

    @Published private(set) var state: AppState<Output> = .loading

    private let mealsAPIManager: MealsAPIManageable

    init(mealsAPIManager: MealsAPIManageable = MealsAPIManager.shared) {
        self.mealsAPIManager = mealsAPIManager
    }

    // updates the state of the view based on the API response
    private func updateState(_ newState: AppState<Output>) {
        DispatchQueue.main.async { [unowned self] in
            self.state = newState
        }
    }

    // loads all the meals for the given category
    func loadData() async {
        let result = await mealsAPIManager.loadMeals(.category(CategoryType.Dessert.rawValue))
        switch result {
        case .success(var meals):
            // sort meals in alphabetical order
            meals.sort(by: { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending })
            updateState(.data(meals))
        case .failure:
            updateState(.error)
        }
    }
}
