//
//  JetSkiViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
import Alamofire

final class JetskiViewController: UITableViewController {
    
    private let jsonUrl = "https://pastebin.com/raw/NwTvsm3Q" 
    
    private var selectedJetski: Jetskis!
    private var jetskis: [Jetskis] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchJetskis()
    }
    
    func fetchJetskis() {
        // Метод Alamofire, именно здесь нужно было бы написать другое, если бы использовала URLSessions
        // делаем запрос на сервер(request) и получаем ответ DataResponse
        AF.request(jsonUrl)
            .validate()
        // без validate() всегда будет отображаться success, поэтому validate() обязательно
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):           // value имеет тип Any
                    if let data = try? JSONSerialization.data(withJSONObject: value, options: []),
                       let jetskis = try? JSONDecoder().decode([Jetskis].self, from: data) {
                        self.jetskis = jetskis
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    //MARK: - Подготовка перехода на экран с деталями
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! JetskiDetailViewController
        destinationVC.jetski = selectedJetski
    }
    
    // MARK: - Перемещение на DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedJetski = jetskis[indexPath.row]
        performSegue(withIdentifier: "GoToJetskiDetailVC", sender: nil)
    }
}


// MARK: - Table view data source
extension JetskiViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return jetskis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "jetskiCell", for: indexPath) as? JetskisCell else { return UITableViewCell() }
        
        let jetski = jetskis[indexPath.row]
        cell.configure(with: jetski)
        
        return cell
    }
}

// MARK: - TableViewDelegate
extension JetskiViewController {
       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
}


/*
 func fetchJetskis() -> String {
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
 */
