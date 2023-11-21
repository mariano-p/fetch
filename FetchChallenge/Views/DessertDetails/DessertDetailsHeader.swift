//
//  DessertDetailsHeader.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import SwiftUI

struct DessertDetailsHeader: View {
    
    let strMealThumb: String
    let strMeal: String
    let strArea: String?
        
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: strMealThumb)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 150, height: 150)
            .cornerRadius(16)
            .padding(.leading, 30)

            VStack(alignment: .leading) {
                Text(strMeal)
                    .font(.title)
                    .fontWeight(.medium)
                if let area = strArea {
                    Text(area)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.indigo)
                        .italic()
                }
            }
            .padding(.leading, 10)
            
            Spacer()
        }

    }
    
}

struct DessertDetailsHeader_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsHeader(strMealThumb: MockData.mockDessert.strMealThumb, strMeal: MockData.mockDessert.strMeal, strArea: MockData.mockDessert.strArea)
    }
}
