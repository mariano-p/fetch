//
//  Dessert.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

struct Ingredient: Hashable {
    let name: String
    let quantity: String
}

struct Dessert: Decodable, Hashable {
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strArea: String?
    let strInstructions: String?
    let ingredients: [Ingredient]?

    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strMealThumb, strArea, strInstructions
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }


    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
        strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)

        var tempIngredients: [Ingredient] = []
        for i in 1...20 {
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)")!
            let measureKey = CodingKeys(rawValue: "strMeasure\(i)")!
            if let ingredientName = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               let measure = try container.decodeIfPresent(String.self, forKey: measureKey),
               !ingredientName.isEmpty {
                let ingredient = Ingredient(name: ingredientName, quantity: measure)
                tempIngredients.append(ingredient)
            }
        }
        ingredients = tempIngredients
    }
    
    // Initializer for mock data
    init(idMeal: String, strMeal: String, strMealThumb: String, strArea: String? = nil, strInstructions: String? = nil, ingredients: [Ingredient] = []) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.ingredients = ingredients
    }
    
    // Default initializer
    init() {
        idMeal = ""
        strMeal = ""
        strMealThumb = ""
        strArea = nil
        strInstructions = nil
        ingredients = []
    }
    
}


struct GetAllDessertsResponse: Decodable {
    let meals: [Dessert]
}

struct GetDessertByIdResponse: Decodable {
    let meals: [Dessert] // Response looks the same
}

struct MockData {
    static let mockIngredients: [Ingredient] = [
        Ingredient(name: "Ingredient1", quantity: "1 cup"),
    ]

    static let mockDessert = Dessert(
        idMeal: "53049",
        strMeal: "Apam balik",
        strMealThumb: "https://www.themealdb.com/images/media/meals/vvusxs1483907034.jpg",
        strArea: "Malaysian",
        strInstructions: "...",
        ingredients: mockIngredients
    )

    static let desserts: [Dessert] = [mockDessert, mockDessert, mockDessert, mockDessert]
}
