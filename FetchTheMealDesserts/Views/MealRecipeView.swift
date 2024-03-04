//
//  MealRecipeView.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/29/24.
//

import SwiftUI

struct MealRecipeView: View {

    @ObservedObject var viewModel: MealRecipeViewModel

    var body: some View {
        
        ContentView(viewModel: viewModel) { mealRecipe in
            ScrollView {
                VStack(spacing: Constants.Padding.double) {
                    LeftAlignedTextView(
                        text: mealRecipe.name,
                        style: .header
                    )
                    if !mealRecipe.ingredients.isEmpty {
                        VStack {
                            LeftAlignedTextView(
                                text: Constants.Strings.ingredientsHeader,
                                style: .subHeader
                            )
                            ForEach(Array(viewModel.measuredIngredient(for: mealRecipe).enumerated()), id: \.offset) { index, item in
                                LeftAlignedTextView(
                                    text: item,
                                    style: .regular
                                )
                            }
                        }
                    }
                    if let instructions = mealRecipe.instructions {
                        VStack {
                            LeftAlignedTextView(
                                text: Constants.Strings.instructionsHeader,
                                style: .subHeader
                            )
                            LeftAlignedTextView(
                                text: instructions,
                                style: .regular
                            )
                        }
                    }
                }
            }
            .padding(Constants.Padding.double)
        }
        .navigationTitle(Constants.Strings.recipeHeader)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadData()
        }
    }
}
