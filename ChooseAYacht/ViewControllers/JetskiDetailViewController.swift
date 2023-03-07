//
//  JetskiDetailViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import UIKit

final class JetskiDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var jetski: Jetskis!
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    @IBOutlet private var firstPriceLabel: UILabel!
    @IBOutlet private var secondPriceLabel: UILabel!
    
    @IBOutlet private var featuresLabel: UILabel!
    @IBOutlet private var charterActivityOptionsLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let link = jetski?.images?.first, let url = URL(string: link) {
            imageView.load(url: url)
        }
        // либо вот так
        //imageView.image = jetski?.images?.first
        
        nameLabel.text = jetski?.name
         
        firstPriceLabel.text = jetski?.price?.first
        secondPriceLabel.text = jetski?.price?.last
         
        featuresLabel.text = jetski?.features
        charterActivityOptionsLabel.text = jetski?.charterActivityOptions
        descriptionLabel.text = jetski?.description
    }
}

/*
 if (foo?.bar = Bar()) != nil {
     print("bar was set successfully")
 } else {
     print("bar wasn’t set successfully")
 }
 */

