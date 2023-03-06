//
//  DetailsViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit

final class YachtDetailViewController: UIViewController, UIScrollViewDelegate {

    var yacht: Yachts!
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    @IBOutlet private var firstPriceLabel: UILabel!
    @IBOutlet private var secondPriceLabel: UILabel!
    @IBOutlet private var thirdPriceLabel: UILabel!
    
    @IBOutlet private var typeOfBoatLabel: UILabel!
    @IBOutlet private var capacityLabel: UILabel!
    @IBOutlet private var featuresLabel: UILabel!
    @IBOutlet private var charterInclusionsLabel: UILabel!
    @IBOutlet private var charterActivityOptionsLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let link = yacht.images?.first, let url = URL(string: link) {
            imageView.load(url: url)
        }
        
        nameLabel.text = yacht.name
        
        firstPriceLabel.text = yacht.price?.first
        //но здесь потом изменить [1]
        secondPriceLabel.text = yacht.price?[1]
        thirdPriceLabel.text = yacht.price?.last
        
        typeOfBoatLabel.text = yacht.typeOfBoat
        capacityLabel.text = yacht.capacity
        featuresLabel.text = yacht.features
        charterInclusionsLabel.text = yacht.charterInclusions
        charterActivityOptionsLabel.text = yacht.charterActivityOptions
        descriptionLabel.text = yacht.description
    }
}
