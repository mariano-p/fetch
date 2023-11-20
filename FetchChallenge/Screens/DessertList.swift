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
            NavigationView {
                List(viewModel.desserts, id: \.idMeal) { dessert in
                    DessertListCell(dessert: dessert)
                }
                .navigationTitle("Desserts")
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .indigo]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                )
                .scrollContentBackground(.hidden)
            }
            .onAppear {
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
