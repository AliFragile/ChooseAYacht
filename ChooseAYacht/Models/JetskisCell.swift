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
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: jetskis.imageUrl?.first ?? "questionmark") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.jetskiImageView.image = UIImage(data: imageData)
            }
        }
    }
}
