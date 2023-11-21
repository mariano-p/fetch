//
//  InstructionsSection.swift
//  FetchChallenge
//
//  Created by Mariano Patino-Paul on 11/21/23.
//

import SwiftUI

struct InstructionsSectionView: View {
    let instructions: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.top, 30)
                .padding(.bottom, 10)

            Text(instructions)
                .font(.body)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 1)
        }
        .padding(.horizontal)
    }
}
