//
//  NetworkManager.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let getAllDessertsUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let getDessertByIdUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    private init() {}
    
    func getDesserts() async throws -> [Dessert] {
        
        guard let url = URL(string: getAllDessertsUrl) else {
            throw DError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
            
        do {
            let decoder = JSONDecoder()
            let decoderResponse = try decoder.decode(GetAllDessertsResponse.self, from: data)
            let validDesserts = decoderResponse.meals.filter { !$0.strMeal.isEmpty && !$0.strMealThumb.isEmpty }
            return validDesserts
        } catch {
            throw DError.noData
        }
        
    }
    
    func getDessertDetails(mealId: String) async throws -> Dessert {
        let dessertUrl = getDessertByIdUrl + mealId
                
        guard let url = URL(string: dessertUrl) else {
            throw DError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
            
        do {
            let decoder = JSONDecoder()
            let decoderResponse = try decoder.decode(GetDessertByIdResponse.self, from: data)
            return decoderResponse.meals[0]
        } catch {
            throw DError.decodingError
        }
    }

    
}

enum DError: Error {
    case invalidUrl
    case requestFailed
    case noData
    case decodingError
    case invalidResponse
}
