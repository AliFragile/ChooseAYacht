//
//  JetSkiViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit
//import Alamofire

class JetskiViewController: UITableViewController {

    private let jsonUrl = "https://drive.google.com/file/d/1OOL7EAxn62O79qPo-TaSWp_uRwWI04x3/view?usp=share_link"
    
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
    }
     
    //MARK: - Подготовка перехода на экран с деталями
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! JetskiDetailViewController
        destinationVC.jetski = selectedJetski
    }
}
