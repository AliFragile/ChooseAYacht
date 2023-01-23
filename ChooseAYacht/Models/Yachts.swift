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
    
    init(yachtData: [String: String]) {
        name = yachtData["name"]
        imageUrl = yachtData["images"] as? [String]
        price = yachtData["price"] as? [String]
        description = yachtData["description"]
        typeOfBoat = yachtData["typeOfBoat"]
        capacity = yachtData["capacity"]
        features = yachtData["features"]
        charterInclusions = yachtData["charterInclusions"]
        charterActivityOptions = yachtData["charterActivityOptions"]
    }
    
    static func getYachts(from value: Any) -> [Yachts] {
        guard let yachtsData = value as? [[String: String]] else { return [] }
        
        /* можно сделать такой вариант, а можно тот, что ниже:
         var yachts: [Yachts] = []
         
         //для каждого словаря в массиве Яхт
         for yachtData in yachtsData {
         let yacht = Yachts(yachtData: yachtData)
         yachts.append(yacht)
         }
         return yachts
         }
         */
        
        return yachtsData.compactMap{ Yachts(yachtData: $0)}
    }
}

struct YachtsWebsiteDescription: Decodable {
    let yachts: [Yachts]?
    let websiteDescription: String?
    let websiteName: String?
}
