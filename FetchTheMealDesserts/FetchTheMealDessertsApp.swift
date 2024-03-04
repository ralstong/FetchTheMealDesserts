//
//  FetchTheMealDessertsApp.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import SwiftUI

@main
struct FetchTheMealDessertsApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = MealsListViewModel()
            MealsListView(viewModel: vm)
        }
    }
}
