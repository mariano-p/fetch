//
//  NetworkManager.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    private init() {}
    
    func getDesserts(completed: @escaping (Result<[Dessert], DError>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                completed(.failure(.requestFailed))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completed(.failure(.invalidResponse)) // Updated error for clarity
                return
            }

            guard let data = data else {
                completed(.failure(.noData))
                return
            }
            
            do {
//                let json = String(data: data, encoding: .utf8)
//                print("JSON Response: \(json ?? "Invalid JSON")")
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(DessertResponse.self, from: data)
                let validDesserts = decoderResponse.meals.filter { !$0.strMeal.isEmpty && !$0.strMealThumb.isEmpty }
                completed(.success(validDesserts))
                
            } catch {
                print("Decoding error: \(error)")
                completed(.failure(.decodingError))
            }
        }
        
        task.resume()
    }


    
}

enum DError: Error {
    case invalidUrl
    case requestFailed
    case noData
    case decodingError
    case invalidResponse
}
