//
//  ErrorView.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import SwiftUI

/// Reusable error view that takes the loadable objects load function as closure that is tied to the retry button
struct ErrorView: View {
    let retryHandler: () async -> Void
    var body: some View {
        VStack {
            Text(Constants.Strings.errorMessage)
                .padding()
            Spacer()
                .frame(height: Constants.Padding.standard)
            Button(Constants.Strings.retryButton) {
                Task.init {
                    await retryHandler()
                }
            }
        }
    }
}
