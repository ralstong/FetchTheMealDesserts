//
//  MealsAPIManager.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import Foundation

protocol MealsAPIManageable {
    func loadMeals(_ requestType: MealsRequestType) async -> Result<[Meal], Error>
}

class MealsAPIManager: MealsAPIManageable {
    private let baseURL = "https://themealdb.com/api/json/v1/1/"

    static let shared = MealsAPIManager()

    /// Asynchronously fetch data from the Meals API based on the request type
    /// - by category: fetches all the meals for the given category
    /// - by id: fetches the meal recipe for a given meal id
    func loadMeals(_ requestType: MealsRequestType) async -> Result<[Meal], Error> {
        do {
            let data: Data
            switch requestType {
            case .category(let query): data = try await fetchMealsBy(category: query)
            case .id(let query): data = try await fetchMealBy(id: query)
            }
            guard let mealsList = try MealList.parseData(data) else {
                return .failure(APIError.decodingFailed)
            }
            return .success(mealsList)
        } catch let error as APIError {
            print(error.description)
            return .failure(error)
        } catch {
            print("Error : \(error.localizedDescription)")
            return .failure(error)
        }
    }

    /// Builds the URL and fetches the data for all the meals for a given category
    private func fetchMealsBy(category: String) async throws -> Data {
        let urlString = URLBuilder(base: baseURL, category: category).filterByCategoryURLString
        guard let url = URL(string: urlString) else { throw APIError.badURL }
        return try await fetchData(from: url)
    }

    /// Builds the URL and fetches data for the meal recipe for a given meal id
    private func fetchMealBy(id: String) async throws -> Data {
        let urlString = URLBuilder(base: baseURL, id: id).lookupByIDURLString
        guard let url = URL(string: urlString) else { throw APIError.badURL }
        return try await fetchData(from: url)
    }

    /// Fetches data from a URL
    private func fetchData(from url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard !data.isEmpty else {
                throw APIError.emptyData
            }
            return data
        } catch {
            throw APIError.failedRequest(error.localizedDescription)
        }
    }
}
