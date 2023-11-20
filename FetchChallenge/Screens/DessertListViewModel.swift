//
//  DessertListViewModel.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import Foundation

final class DessertListViewModel: ObservableObject {
    
    @Published var desserts = [Dessert]()
    @Published var isLoading = false
    
    func getDesserts() {
        
        isLoading = true
        
        NetworkManager.shared.getDesserts { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let desserts):
                    self.desserts = desserts
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
