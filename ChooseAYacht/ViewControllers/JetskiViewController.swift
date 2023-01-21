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
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.jetskis = try JSONDecoder().decode([Jetskis].self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
        
        // Метод Alamofire, именно здесь нужно было бы написать другое, если бы использовала URLSessions
        AF.request(url).validate().responseJSON { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else { return }
                
        //Сейчас распарсим по нашей моделе эту строчку self.jetskis = try JSONDecoder().decode([Jetskis].self, from: data)  вручную, как это было раньше, когда не было decode: - сделали это в Jetskis:
        //сделали валидацию запроса, без нее result всегда будет равен succes
        //У словаря тип [String: Any]
            switch dataResponse.result {
            case .success(let value):
                     
                self.jetskis = Jetskis.getJetskis(from: value)
                     
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error): print(error)
            }
        }
    }
     
    //MARK: - Подготовка перехода на экран с деталями
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! JetskiDetailViewController
        destinationVC.jetski = selectedJetski
    }
}
