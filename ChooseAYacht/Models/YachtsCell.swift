//
//  YachtsCell.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import UIKit

final class YachtsCell: UITableViewCell {
 
    @IBOutlet private var yachtImageView: UIImageView!
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    
    func configure(with yachts: Yachts) {
        nameLabel.text = yachts.name
        priceLabel.text = yachts.price?.first
        
        yachtImageView.contentMode = .scaleAspectFill
        
        DispatchQueue.global().async {
            let link = "https://lh3.googleusercontent.com/Iw4O8B0edGEQnzlJNUXjfMXVKJv9OKlbGKV1LSwHoifN8QaD5jeVVV_NGcY0fXSjIxwPGMeNrwmRFr2AQXD-_O2-pj4JNd_LBp-Fh2a8"
            // if let link = yachts.images?.first,
            if let imageUrl = URL(string: link),
               let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.yachtImageView.image = UIImage(data: imageData)
                }
            } else if let image = UIImage(named: "questionmark") {
                DispatchQueue.main.async {
                    self.yachtImageView.image = image
                }
            }
        }
    }
}

