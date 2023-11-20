//
//  Dessert.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

struct Dessert: Decodable {
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
}

struct DessertResponse: Decodable {
    let meals: [Dessert]
}

struct MockData {
    static let mockDessert = Dessert(idMeal: "1234", strMeal: "Crema Volteada", strMealThumb: "https://www.themealdb.com/images/media/meals/vvusxs1483907034.jpg")
    static let desserts: [Dessert] = [mockDessert, mockDessert, mockDessert, mockDessert]
}
