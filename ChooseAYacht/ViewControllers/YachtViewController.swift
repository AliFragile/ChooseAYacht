//
//  YachtViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
import Alamofire

class YachtViewController: UITableViewController {

    private let jsonUrl = "https://drive.google.com/file/d/1tbuaxHGbXpr1ENDB317zZz1E1IZDKjTb/view?usp=share_link"
    
    private var selectedYacht: Yachts!
    private var yachts: [Yachts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchYachts()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return yachts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yachtCell", for: indexPath) as! YachtsCell

        let yacht = yachts[indexPath.row]
        cell.configure(with: yacht)

        return cell
    }
    
    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - Перемещение на DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedYacht = yachts[indexPath.row]
        performSegue(withIdentifier: "GoToYachtDetailVC", sender: nil)
    }
    
    func fetchYachts() {
        guard let url = URL(string: jsonUrl) else { return }
        
        // Метод Alamofire, именно здесь нужно было бы написать другое, если бы использовала URLSessions
        AF.request(url).validate().responseJSON { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else { return }
                
        //Сейчас распарсим по нашей моделе эту строчку self.yachts = try JSONDecoder().decode([Yachts].self, from: data)  вручную, как это было раньше, когда не было decode: - сделали это в Yachts:
        //сделали валидацию запроса, без нее result всегда будет равен succes
        //У словаря тип [String: Any]
            switch dataResponse.result {
            case .success(let value):
                     
                self.yachts = Yachts.getYachts(from: value)
                     
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error): print(error)
            }
        }
    }
     
    //MARK: - Подготовка перехода на экран с деталями
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! YachtDetailViewController
        destinationVC.yacht = selectedYacht
    }
}
