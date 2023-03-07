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
            let image = UIImage(named: "questionmark")
            guard let imageString = image?.toPngString() else { return }
            
            if let imageUrl = URL(string: yachts.images?.first ?? imageString),
               let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.yachtImageView.image = UIImage(data: imageData)
                }
            } else {
                DispatchQueue.main.async {
                    self.yachtImageView.image = image
                }
            }
            
            /*
            guard let imageUrl = URL(string: yachts.images?.first ?? imageString) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl)  else { return }
            
            DispatchQueue.main.async {
                self.yachtImageView.image = UIImage(data: imageData)
            }
             */
        }
    }
}

