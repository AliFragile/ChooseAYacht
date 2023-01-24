//
//  JetSkiViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
import Alamofire

class JetskiViewController: UITableViewController {

    private let jsonUrl = "https://drive.google.com/file/d/1HPRx-N53FAJ3zV2BwXY2uK84iYy7pIuC/view?usp=share_link"
    
    private var selectedJetski: Jetskis!
    private var jetskis: [Jetskis] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchJetskis()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return jetskis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jetskiCell", for: indexPath) as! JetskisCell

        let jetski = jetskis[indexPath.row]
        cell.configure(with: jetski)

        return cell
    }
    
    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - Перемещение на DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedJetski = jetskis[indexPath.row]
        performSegue(withIdentifier: "GoToJetskiDetailVC", sender: nil)
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
                    self.jetskis = Jetskis.getJetskis(from: value)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
//    //MARK: - Подготовка перехода на экран с деталями
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! JetskiDetailViewController
//        destinationVC.jetski = selectedJetski
//    }
}
