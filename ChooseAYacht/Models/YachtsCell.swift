//
//  YachtsCell.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import UIKit

class YachtsCell: UITableViewCell {
 
    @IBOutlet var yachtImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    func configure(with yachts: Yachts) {
        titleLabel.text = yachts.name
        priceLabel.text = yachts.price
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: yachts.imageUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.yachtImage.image = UIImage(data: imageData)
            }
        }
    }
}

