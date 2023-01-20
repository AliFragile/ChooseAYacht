//
//  Jetskis.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import Foundation

struct Jetskis: Decodable {
    let name: String?
    let imageUrl: [String]?
    let price: [String]?
    let description: String?
    let features: String?
    let charterActivityOptions: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageUrl = "images"
        case price = "price"
        case description = "description"
        case features = "features"
        case charterActivityOptions = "charterActivityOption"
    }
}

struct JetskisWebsiteDescription: Decodable {
    let jetskis: [Jetskis]?
    let websiteDescription: String?
    let websiteName: String?
}
