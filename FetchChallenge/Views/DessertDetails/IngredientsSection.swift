//
//  IngredientsSection.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/21/23.
//

import SwiftUI

struct IngredientsSectionView: View {
    let ingredients: [Ingredient]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.leading)
                .padding(.top, 30)

            ForEach(ingredients, id: \.hashValue) { ingredient in
                IngredientListItem(ingredient: ingredient)
                    .padding(.horizontal)
            }
        }
    }
}
