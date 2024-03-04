//
//  ContentView.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import SwiftUI

/// View that decides which subview to display based on the app state
/// - loading: display a loading spinner
/// - error: display an error view that takes the loadable objects load function as closure that is tied to the retry button
/// - data: displays the intended content view along with the associated data
struct ContentView<ViewModel: LoadableObject, Content: View>: View {
    @ObservedObject var viewModel: ViewModel
    var content: (ViewModel.Output) -> Content

    init(viewModel: ViewModel, @ViewBuilder content: @escaping (ViewModel.Output) -> Content) {
        self.viewModel = viewModel
        self.content = content
    }

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error:
            ErrorView(retryHandler: viewModel.loadData)
        case .data(let output):
            content(output)
        }
    }
}
