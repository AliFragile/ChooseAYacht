//
//  JetskisCell.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import UIKit

class JetskisCell: UITableViewCell {
 
    @IBOutlet var jetskiImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    func configure(with jetskis: Jetskis) {
        titleLabel.text = jetskis.name
        priceLabel.text = jetskis.price?[0]
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: jetskis.imageUrl![0]) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.jetskiImage.image = UIImage(data: imageData)
            }
        }
    }
}
