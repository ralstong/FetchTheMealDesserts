//
//  MealsListView.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import SwiftUI

struct MealsListView: View {

    @StateObject var viewModel: MealsListViewModel

    var body: some View {
        NavigationStack {
            ContentView(viewModel: viewModel) { mealList in
                List(mealList, id: \.id) { meal in
                    NavigationLink {
                        MealRecipeView(viewModel: MealRecipeViewModel(id: meal.id))
                    } label: {
                        MealRowView(meal: meal)
                    }
                }
            }
            .navigationTitle(Constants.Strings.dessertsHeader)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.loadData()
        }
    }
}
