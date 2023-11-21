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
        ZStack {
            HStack {
                AsyncImage(url: URL(string: viewModel.dessert.strMealThumb)) { image in
                          image
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              
                      } placeholder: {
                          Color.gray
                      }
                      .frame(width: 90, height: 90)
                      .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.dessert.strMeal)
                        .font(.title2)
                        .fontWeight(.medium)
                    if let strArea = viewModel.dessert.strArea {
                        Text(strArea)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }

                
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
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
