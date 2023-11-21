//
//  DessertList.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/20/23.
//

import SwiftUI

struct DessertList: View {
    
    @StateObject var viewModel = DessertListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.desserts, id: \.idMeal) { dessert in
                    NavigationLink(value: dessert) {
                        DessertListCell(dessert: dessert)
                    }
                    .listRowBackground(Color.white.opacity(0.5))
                }

                .navigationTitle("Desserts")
                .navigationDestination(for: Dessert.self) { dessert in
                    DessertDetails(dessertId: dessert.idMeal)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .indigo]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                )
                .scrollContentBackground(.hidden)
            }
            .accentColor(.indigo)
            .task {
                viewModel.getDesserts()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }


    }

}

struct DessertList_Previews: PreviewProvider {
    static var previews: some View {
        DessertList()
    }
}
