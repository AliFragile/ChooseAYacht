//
//  YachtViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
import Alamofire

final class YachtViewController: UITableViewController {
    
    //c Pastebin измененный файл
    private let jsonUrl = "https://pastebin.com/raw/vC1GWWCh" 
    
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
                     if let data = try? JSONSerialization.data(withJSONObject: value, options: []),
                        let yachts = try? JSONDecoder().decode([Yachts].self, from: data) {
                         self.yachts = yachts
                         DispatchQueue.main.async {
                             self.tableView.reloadData()
                         }
                     }
                 case .failure(let error):
                     print(error)
                 }
             }
     }
     
     
    // Для проверки:
    /*
    func fetchYachts() -> String {
        var circData = "emptyString"
        let session = URLSession.shared
        let url = URL(string: "https://pastebin.com/raw/zZB72rLq")!
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
     */
     
    //    //MARK: - Подготовка перехода на экран с деталями
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! YachtDetailViewController
            destinationVC.yacht = selectedYacht
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let detailVC = segue.destination as! YachtDetailViewController
//           // detailVC.trackName = trackList[indexPath.row]
//        }
//    }
    
}
     

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
        return 120
        
    }
}
