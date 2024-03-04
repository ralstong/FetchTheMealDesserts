//
//  AppState.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 3/1/24.
//

import Foundation

/// LoadableObject protocol that conforms to ObservableObject and defines necessary properties and functions for a loadable view
protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: AppState<Output> { get }
    func loadData() async
}

/// AppState enum which takes in a generic value for data
enum AppState<Value> {
    case loading
    case data(Value)
    case error
}

// added to support unit testing
extension AppState: Equatable where Value: Equatable {}
