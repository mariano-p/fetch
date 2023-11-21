//
//  DessertListCell.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import SwiftUI

struct DessertListCell: View {
    
    let dessert: Dessert
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          
                  } placeholder: {
                      Color.gray
                  }
                  .frame(width: 90, height: 90)
                  .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(dessert.strMeal)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
        }
    }
    
}
