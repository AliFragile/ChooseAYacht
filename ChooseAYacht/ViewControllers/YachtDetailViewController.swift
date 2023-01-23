//
//  DetailsViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit

class YachtDetailViewController: UIScrollView {

    var yacht: Yachts!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
    



}

/*
 class DetailViewController: UIViewController {

     var trip: Trips!

     @IBOutlet var image: UIImageView!
     @IBOutlet var titleLabel: UILabel!
     @IBOutlet var priceLabel: UILabel!
     @IBOutlet var descriptionLabel: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         titleLabel.text = trip.name
         priceLabel.text =  trip.price
         descriptionLabel.text = trip.description
        
         displayImage(for: trip)
     }
     
     private func displayImage(for trip: Trips) {
         
         let imagePath = trip.imageUrl
         guard let imageUrl = URL(string: "\(imagePath)") else { return }
         guard let imageData = try? Data(contentsOf: imageUrl) else { return }
         
         image.image = UIImage(data: imageData)
     }

 }
 */
