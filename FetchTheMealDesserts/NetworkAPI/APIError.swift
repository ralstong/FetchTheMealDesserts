//
//  APIError.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 2/28/24.
//

import Foundation

/// APIError enum that can be utilized to customize error cases handling
/// - badURL: the url is malformed
/// - emptyData: the data received is empty
/// - decodingFailed: the data decoding failed
/// - failedRequest(String): the request failed due to some reason, for example network issue, server error, etc.
enum APIError: Error {
    case badURL
    case emptyData
    case decodingFailed
    case failedRequest(String)

    var description: String {
        switch self {
        case .badURL:
            return "MealsAPI Error: Bad URL."
        case .emptyData:
            return "MealsAPI Error: Data received is empty."
        case .decodingFailed:
            return "MealsAPI Error: JSON decoding failed."
        case .failedRequest(let error):
            return "MealsAPI Error: \(error)"
        }
    }
}
