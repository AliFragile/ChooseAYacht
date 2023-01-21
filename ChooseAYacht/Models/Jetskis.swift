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
    
    init(dictJetski: [String: Any]) {
        name = dictJetski["name"] as? String  //тип Any приводим к типу String
        imageUrl = dictJetski["images"] as? [String]
        price = dictJetski["price"] as? [String]
        description = dictJetski["description"] as? String
        features = dictJetski["features"] as? String
        charterActivityOptions = dictJetski["charterActivityOption"] as? String
    }
    
    static func getJetskis(from jsonData: Any) -> [Jetskis] {
        guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }  //теперь это массив
        
        //Можно сделать так:
//        var yachts: [Yachts] = []
//
//        for dictYacht in jsonData {
//            let yacht = Yacht(dictYacht: dictYacht)
//            yachts.append(yacht)
//        }
//
//        return yachts
        
        //А можно сделать через функциональное программирование в одну строчку:
        return jsonData.compactMap { Jetskis(dictJetski: $0) }   //$0 - это каждый словарь(каждый элемент массива)
    }
}

struct JetskisWebsiteDescription: Decodable {
    let jetskis: [Jetskis]?
    let websiteDescription: String?
    let websiteName: String?
}

