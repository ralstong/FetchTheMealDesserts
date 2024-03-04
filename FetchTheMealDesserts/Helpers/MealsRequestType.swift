//
//  MealsRequestType.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 3/1/24.
//

import Foundation

/// Meals API request type enum
/// - category(String): fetch by specific category
/// - id(String): fetch by specifc id
enum MealsRequestType {
    case category(String)
    case id(String)
}
