//
//  Meal.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import Foundation

struct Meal: Decodable {
    let name: String
    let imageUrl: URL?
    let id: String
    let instructions: String?
    var ingredients: [String] = []
    var measurements: [String] = []
}

extension Meal {
    enum DecodingKeys: CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
        case strInstructions
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        id = try container.decode(String.self, forKey: .idMeal)
        name = try container.decode(String.self, forKey: .strMeal)
        imageUrl = try container.decodeIfPresent(URL.self, forKey: .strMealThumb)
        
        instructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        
        // decode ingredients until value is non-empty
        for i in 1...20 {
            let value = try container.decodeIfPresent(String.self, forKey: DecodingKeys(stringValue: "strIngredient\(i)") ?? .strIngredient1)
            guard let ingredient = value?.trimmingCharacters(in: .whitespaces), !ingredient.isEmpty else { break }
            ingredients.append(ingredient)
        }
        
        // decode measurements until value is non-empty
        for i in 1...20 {
            let value = try container.decodeIfPresent(String.self, forKey: DecodingKeys(stringValue: "strMeasure\(i)") ?? .strMeasure1)
            guard let measure = value?.trimmingCharacters(in: .whitespaces), !measure.isEmpty else { break }
            measurements.append(measure)
        }
    }
}

// added to support unit testing
extension Meal: Equatable {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        lhs.id == rhs.id
    }
}
