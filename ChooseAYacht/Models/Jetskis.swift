//
//  Jetskis.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import Foundation

struct Jetskis: Decodable {
    let name: String
    let imageUrl: [String]
    let price: [String]
    let description: String
    let features: String
    let charterActivityOptions: String
}
