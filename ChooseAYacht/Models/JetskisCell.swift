//
//  JetskisCell.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import UIKit

final class JetskisCell: UITableViewCell {
 
    @IBOutlet private var jetskiImageView: UIImageView!
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    
    func configure(with jetskis: Jetskis) {
        nameLabel.text = jetskis.name
        priceLabel.text = jetskis.price?.first
        
        jetskiImageView.contentMode = .scaleAspectFill
        
        DispatchQueue.global().async {
            let link = "https://lh3.googleusercontent.com/Iw4O8B0edGEQnzlJNUXjfMXVKJv9OKlbGKV1LSwHoifN8QaD5jeVVV_NGcY0fXSjIxwPGMeNrwmRFr2AQXD-_O2-pj4JNd_LBp-Fh2a8"
           // if let link = jetskis.images?.first,
               if let imageUrl = URL(string: link),
               let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.jetskiImageView.image = UIImage(data: imageData)
                }
            } else if let image = UIImage(named: "questionmark") {
                DispatchQueue.main.async {
                    self.jetskiImageView.image = image
                }
            }
        }
    }
}
