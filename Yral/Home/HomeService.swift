//
//  HomeService.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import Foundation
protocol HomeServiceUsecase: AnyObject {
    func fetchHomeData() async throws -> HomeModel
}

class HomeService: HomeServiceUsecase {
    let networkManager = NetworkManager.shared
    
    func fetchHomeData() async throws -> HomeModel {
        guard let data = Utils.readLocalJSONFile(forName: "homeMockResponse") else {
            throw YError.invalidFile
        }
        do {
           let model = try JSONDecoder().decode(HomeModel.self, from: data)
            return model
        } catch {
            throw YError.invalidJSON
        }
    }
}
