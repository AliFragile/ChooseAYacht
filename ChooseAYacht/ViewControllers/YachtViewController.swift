//
//  YachtViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
import Alamofire

final class YachtViewController: UITableViewController {
    
    private let jsonUrl = "https://chooseayacht-default-rtdb.firebaseio.com/Yachts-List.json"
    
    private var selectedYacht: Yachts!
    private var yachts: [Yachts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchYachts()
    }
    
    // MARK: - Перемещение на DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedYacht = yachts[indexPath.row]
        performSegue(withIdentifier: "GoToYachtDetailVC", sender: nil)
    }
    
    func fetchYachts() {
        // Метод Alamofire, именно здесь нужно было бы написать другое, если бы использовала URLSessions
        // делаем запрос на сервер(request) и получаем ответ DataResponse
        AF.request(jsonUrl)
            .validate()
        // без validate() всегда будет отображаться success, поэтому validate() обязательно
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):           // value имеет тип Any
                    self.yachts = Yachts.getYachts(from: value)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        
    }
}
//    //MARK: - Подготовка перехода на экран с деталями
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! YachtDetailViewController
//        destinationVC.yacht = selectedYacht
//    }



// MARK: - Table view data source
extension YachtViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return yachts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "yachtCell", for: indexPath) as? YachtsCell else { return UITableViewCell() }

        let yacht = yachts[indexPath.row]
        cell.configure(with: yacht)

        return cell
    }
}

// MARK: - TableViewDelegate
extension YachtViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


/*
 unc fetchTrips() {
     guard let url = URL(string: jsonUrl) else { return }
     
     URLSession.shared.dataTask(with: url) { (data, _, _) in
         
         guard let data = data else { return }
         
         do {
             self.trips = try JSONDecoder().decode([Trips].self, from: data)
         } catch let error {
             print(error)
         }
     }.resume()
 }
 */


/*
 func fetchYachts() -> String {
             var circData = "emptyString"
             let session = URLSession.shared
             let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
             let task = session.dataTask(with: url, completionHandler: { data, response, error in
                 print("1111", data)
                 let json = try! JSONSerialization.jsonObject(with: data!, options: [])
     //                print("json: ", json) // prints the whole json file, verifying the connection works. Some 300kb of data.
     //                print("json file type: ", type(of: json)) // prints '__NSArrayI'
                     print("1111", json)
                     let jsonString = "\(json)"
                     circData = jsonString
     //                print("circData", circData) // prints the whole json file, verifying that the json string has been assigned to 'circData'
                 
             })
             task.resume()
     //        print("after: ", circData) // prints 'after: emptyString'. It's as if the reassignment didn't take place.
             return circData
         }
     /*
     // Метод Alamofire, именно здесь нужно было бы написать другое, если бы использовала URLSessions
     // делаем запрос на сервер(request) и получаем ответ DataResponse
     AF.request(jsonUrl)
         .validate()
     // без validate() всегда будет отображаться success, поэтому validate() обязательно
         .responseJSON { dataResponse in
             print(dataResponse, "111111111")
             switch dataResponse.result {
             case .success(let value):           // value имеет тип Any
                 self.yachts = Yachts.getYachts(from: value)
                 DispatchQueue.main.async {
                     self.tableView.reloadData()
                 }
             case .failure(let error):
                 print(error)
             }
         }
      */
 }
 */
