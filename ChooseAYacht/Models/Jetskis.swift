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
    
    init(jetskiData: [String: Any]) {
        name = jetskiData["name"] as? String
        imageUrl = jetskiData["images"] as? [String]
        price = jetskiData["price"] as? [String]
        description = jetskiData["description"] as? String
        features = jetskiData["features"] as? String
        charterActivityOptions = jetskiData["charterActivityOptions"] as? String
    }
    
    static func getJetskis(from value: Any) -> [Jetskis] {
        guard let jetskisData = value as? [[String: String]] else { return [] }
        
        //Можно сделать так:
//        var jetskis: [Jetskis] = []
//
//        for jetskiData in jetskisData {
//            let jetski = Jetskis(jetskiData: jetskiData)
//            jetskis.append(jetski)
//        }
//
//        return jetskis
        
        //А можно сделать через функциональное программирование в одну строчку:
        return jetskisData.compactMap { Jetskis(jetskiData: $0) }   //$0 - это каждый словарь(каждый элемент массива)
    }
}


/*
struct JetskisWebsiteDescription: Decodable {
    let jetskis: [Jetskis]?
    let websiteDescription: String?
    let websiteName: String?
}
*/
