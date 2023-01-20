//
//  YachtsAndJetskis.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

struct Yachts: Decodable {
    let name: String?
    let imageUrl: [String]?
    let price: [String]?
    let description: String?
    let typeOfBoat: String?
    let capacity: String?
    let features: String?
    let charterInclusions: String?
    let charterActivityOptions: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageUrl = "images"
        case price = "price"
        case description = "description"
        case typeOfBoat = "typeOfBoat"
        case capacity = "capacity"
        case features = "features"
        case charterInclusions = "charterInclusions"
        case charterActivityOptions = "charterActivityOption"
    }
    
    init(dictYacht: [String: Any]) {
        name = dictYacht["name"] as? String  //тип Any приводим к типу String
        imageUrl = dictYacht["images"] as? [String]
        price = dictYacht["price"] as? [String]
        description = dictYacht["description"] as? String
        typeOfBoat = dictYacht["typeOfBoat"] as? String
        capacity = dictYacht["capacity"] as? String
        features = dictYacht["features"] as? String
        charterInclusions = dictYacht["charterInclusions"] as? String
        charterActivityOptions = dictYacht["charterActivityOption"] as? String
    }
    
    static func getYachts(from jsonData: Any) -> [Yachts] {
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
        return jsonData.compactMap { Yachts(dictYacht: $0) }   //$0 - это каждый словарь(каждый элемент массива)
    }
}

struct YachtsWebsiteDescription: Decodable {
    let yachts: [Yachts]?
    let websiteDescription: String?
    let websiteName: String?
}
