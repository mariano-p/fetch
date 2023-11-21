//
//  DessertListViewModel.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

@MainActor final class DessertListViewModel: ObservableObject {
    
    @Published var desserts = [Dessert]()
    @Published var isLoading = false
    
    func getDesserts() {
        isLoading = true

        Task {
            do {
                desserts = try await NetworkManager.shared.getDesserts()
                isLoading = false
            } catch {
                isLoading = false
                throw DError.requestFailed
            }
        }

    }
    
}
