//
//  YachtDetailViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 15.01.2023.
//

import UIKit

final class YachtDetailViewController: UIViewController, UIScrollViewDelegate {

    var yacht: Yachts!

    @IBOutlet private var photoGallery: UICollectionView!

    @IBOutlet private var pageControl: UIPageControl!
    
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
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.currentPage = 0
        
        guard let array = yacht?.images else { return }
        pageControl.numberOfPages = array.count
        
        nameLabel.text = yacht?.name

        firstPriceLabel.text = yacht?.price?.first
        thirdPriceLabel.text = yacht?.price?.last
        secondPriceLabel.text = yacht?.price?[1]
        
        /*
        guard let number = yacht?.price else { return }
        for index in number {
            if index == number[1] {
                secondPriceLabel.text = number[1]
            } else { return }
        }
        */
        
        typeOfBoatLabel.text = yacht?.typeOfBoat
        capacityLabel.text = yacht?.capacity
        featuresLabel.text = yacht?.features
        charterInclusionsLabel.text = yacht?.charterInclusions
        charterActivityOptionsLabel.text = yacht?.charterActivityOptions
        descriptionLabel.text = yacht?.description
    }
}

extension YachtDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let array = yacht?.images?.count else { return 0 }
        return array
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryYachtCell", for: indexPath) as! PhotoGalleryYachtsCollectionView
        
        cell.imageView.contentMode = .scaleAspectFit
            //.scaleAspectFill
        
        if let link = yacht?.images?[indexPath.row], let url = URL(string: link) {
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
