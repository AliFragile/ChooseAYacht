//
//  DetailsViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit

final class YachtDetailViewController: UIViewController, UIScrollViewDelegate {

    var yacht: Yachts!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var firstPriceLabel: UILabel!
    @IBOutlet var secondPriceLabel: UILabel!
    @IBOutlet var thirdPriceLabel: UILabel!
    
    @IBOutlet var typeOfBoatLabel: UILabel!
    @IBOutlet var capacityLabel: UILabel!
    @IBOutlet var featuresLabel: UILabel!
    @IBOutlet var charterInclusionsLabel: UILabel!
    @IBOutlet var charterActivityOptionsLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let link = yacht?.images?.first, let url = URL(string: link) {
            imageView.load(url: url)
        }

        nameLabel.text = yacht?.name

        firstPriceLabel.text = yacht?.price?.first
        //но здесь потом изменить [1]
        secondPriceLabel.text = yacht?.price?[1]
        thirdPriceLabel.text = yacht?.price?.last

        typeOfBoatLabel.text = yacht?.typeOfBoat
        capacityLabel.text = yacht?.capacity
        featuresLabel.text = yacht?.features
        charterInclusionsLabel.text = yacht?.charterInclusions
        charterActivityOptionsLabel.text = yacht?.charterActivityOptions
        descriptionLabel.text = yacht?.description
    }
}
