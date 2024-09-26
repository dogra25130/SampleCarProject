//
//  ContentView.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import SwiftUI

struct HomeView: View {
    let viewModel = HomeViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: .p20) {
                TopView.padding(.top, .p14)
                VStack(spacing: .p22) {
                    CarInfoView
                    ProfileViewContainer
                    MoreCarsView
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, .p28)
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    HomeView()
}
