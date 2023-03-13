//
//  UIImageView + loadUrl.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 06.03.2023.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        self.addSubview(activityIndicator)
        contentMode = .scaleToFill
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        activityIndicator.stopAnimating()
                    }
                }
            }
        }
    }
}
