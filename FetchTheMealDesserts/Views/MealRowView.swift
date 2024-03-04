//
//  MealRowView.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import SwiftUI

struct MealRowView: View {
    var meal: Meal

    var body: some View {
        HStack(spacing: Constants.Padding.double, content: {
            LeftAlignedTextView(
                text: meal.name,
                style: .subHeader
            )
            if let url = meal.imageUrl {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if let _ = phase.error {
                        Color.gray
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: Constants.Size.imageSize, height: Constants.Size.imageSize)
            } else {
                // Fallback
                Color.gray
                    .frame(width: Constants.Size.imageSize, height: Constants.Size.imageSize)
            }
        })
        .padding(Constants.Padding.double)
    }
}
