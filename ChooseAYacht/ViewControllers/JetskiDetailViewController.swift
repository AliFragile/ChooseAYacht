//
//  JetskiDetailViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 17.01.2023.
//

import UIKit

final class JetskiDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var jetski: Jetskis!
    
    @IBOutlet var photoGallery: UICollectionView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet private var nameLabel: UILabel!
    
    @IBOutlet private var firstPriceLabel: UILabel!
    @IBOutlet private var secondPriceLabel: UILabel!
   
    @IBOutlet private var featuresLabel: UILabel!
    @IBOutlet private var charterActivityOptionsLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.currentPage = 0
        
        guard let array = jetski?.images else { return }
        pageControl.numberOfPages = array.count
      
        nameLabel.text = jetski?.name
         
        firstPriceLabel.text = jetski?.price?.first
        secondPriceLabel.text = jetski?.price?.last
         
        featuresLabel.text = jetski?.features
        charterActivityOptionsLabel.text = jetski?.charterActivityOptions
        descriptionLabel.text = jetski?.description
    }
}

extension JetskiDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let array = jetski?.images?.count else { return 0 }
        return array
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryJetskiCell", for: indexPath) as! PhotoGalleryJetskisCollectionView
        
        cell.imageView.contentMode = .scaleAspectFit
            //.scaleAspectFill
        
        if let link = jetski?.images?[indexPath.row], let url = URL(string: link) {
            cell.imageView.load(url: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: photoGallery.frame.width, height: photoGallery.frame.height)
    }
    
}
