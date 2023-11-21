//
//  IngredientListItem.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import SwiftUI

struct IngredientListItem: View {
    
    let ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text(ingredient.name)
                .font(.title3)
                .fontWeight(.medium)
            Spacer()
            Text(ingredient.quantity)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.indigo)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
    
}
