//
//  HomeModel.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import SwiftUI
struct HomeModel: Codable {
    let extraInfoModel: [ImageLabelInfoModel]
    let carInfoModel: CarInfoModel
    let profileModel: ProfileModel
    let moreCarModel: MoreCarsModel
}

struct ImageLabelInfoModel: Codable, Identifiable {
    var id = UUID().uuidString
    let imageURL: String
    let title: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    enum CodingKeys: CodingKey {
        case imageURL
        case title
        case imageWidth
        case imageHeight
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageWidth = try container.decode(CGFloat.self, forKey: .imageWidth)
        self.imageHeight = try container.decode(CGFloat.self, forKey: .imageHeight)
    }
}

struct ProfileModel: Codable {
    let imageURL: String
    let title: String
    let amount: String
}

struct MoreCarsModel: Codable {
    let title: String
    let carModels: [MoreCarModelInfo]    
}


struct MoreCarModelInfo: Codable, Identifiable {
    var id = UUID().uuidString
    let title: String
    let extraInfoModel: [ImageLabelInfoModel]
    
    enum CodingKeys: CodingKey {
        case title
        case extraInfoModel
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.extraInfoModel = try container.decode([ImageLabelInfoModel].self, forKey: .extraInfoModel)
    }
}

struct CarInfoModel: Codable {
    let title: String
    let image: String
    let carName: String
    let infoLabel: [ImageLabelInfoModel]
    let price: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
}
