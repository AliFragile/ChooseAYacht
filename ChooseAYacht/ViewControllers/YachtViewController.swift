//
//  YachtViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
//import Alamofire

class YachtViewController: UITableViewController {

    private let jsonUrl = "https://drive.google.com/file/d/1OOL7EAxn62O79qPo-TaSWp_uRwWI04x3/view?usp=share_link"
    
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
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.yachts = try JSONDecoder().decode([Yachts].self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
    }
     
    //MARK: - Подготовка перехода на экран с деталями
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! YachtDetailViewController
        destinationVC.yacht = selectedYacht
    }
}
