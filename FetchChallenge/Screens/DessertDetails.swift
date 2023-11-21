//
//  DessertDetails.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import SwiftUI

struct DessertDetails: View {
    
    var dessertId: String
    @StateObject var viewModel = DessertDetailsViewModel()
        
    var body: some View {
        ScrollView {
            VStack {
                DessertDetailsHeader(strMealThumb: viewModel.dessert.strMealThumb, strMeal: viewModel.dessert.strMeal, strArea: viewModel.dessert.strArea)

                if let ingredients = viewModel.dessert.ingredients {
                    IngredientsSectionView(ingredients: ingredients)
                }
                
                if let instructions = viewModel.dessert.strInstructions {
                    InstructionsSectionView(instructions: instructions)
                }
            }
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.white, .indigo.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .overlay(
            Group {
                if viewModel.isLoading {
                    LoadingView()
                }
            }
        )
        .task {
            await viewModel.getDessertDetails(dessertId: dessertId)
        }
    }
}

struct DessertDetails_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetails(dessertId: MockData.mockDessert.idMeal)
    }
}
