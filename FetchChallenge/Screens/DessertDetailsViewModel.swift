//
//  DessertDetailsViewModel.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

@MainActor final class DessertDetailsViewModel: ObservableObject {
    
    @Published var dessert = Dessert()
    @Published var isLoading = false
    @Published var errorMessage: String?

    func getDessertDetails(dessertId: String) async {
        isLoading = true
        errorMessage = nil

        do {
            let details = try await NetworkManager.shared.getDessertDetails(mealId: dessertId)
            dessert = details
        } catch {
            print("Error fetching: \(error)")
        }
        isLoading = false
    }
}
