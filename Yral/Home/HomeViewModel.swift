//
//  ContentViewModel.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import SwiftUI

@Observable
class HomeViewModel {
    var dataModel: HomeModel?
    let usecase: HomeServiceUsecase
    
    init(usecase: HomeServiceUsecase = HomeService()) {
        self.usecase = usecase
    }
    
    func fetchData() async {
        do {
            dataModel = try await usecase.fetchHomeData()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
