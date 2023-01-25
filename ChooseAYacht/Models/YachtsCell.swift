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
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: yachts.imageUrl?.first ?? "questionmark") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.yachtImageView.image = UIImage(data: imageData)
            }
        }
    }
}

