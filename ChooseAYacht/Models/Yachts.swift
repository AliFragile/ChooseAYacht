//
//  YachtsAndJetskis.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import Foundation

struct Yachts: Decodable {
    let name: String
    let imageUrl: [String]
    let price: [String]
    let description: String
    let typeOfBoat: String
    let capacity: String
    let features: String
    let charterInclusions: String
    let charterActivityOptions: String
}
