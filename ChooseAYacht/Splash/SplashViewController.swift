//
//  SplashViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 13.01.2023.
//

import UIKit

final class SplashViewController: UIViewController {
    
    @IBOutlet var yachtImageView: UIImageView!
    @IBOutlet var textImageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animate()
    }
    
    private func animate() {
        // убираю картинки текста и яхты, чтобы не было видно
        yachtImageView.transform = CGAffineTransform(translationX: -150, y:0)
        textImageView.transform = CGAffineTransform(translationX: 300, y: 0)
        yachtImageView.alpha = 0
        textImageView.alpha = 0
        
        // анимация
        UIView.animate(withDuration: 2, animations: { [self] in
            yachtImageView?.transform = .identity
            textImageView?.transform = .identity
            yachtImageView.alpha = 1
            textImageView.alpha = 1
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    //self.performSegue(withIdentifier: "ShowMainVC", sender: nil)

                    guard let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") else { return }
                    newViewController.modalTransitionStyle = .crossDissolve
                    newViewController.modalPresentationStyle = .fullScreen
                    self.show(newViewController, sender: nil)
                    
                    
                })
            }
        })
    }
}

/*
 let viewController = MainViewController()
                    viewController.modalTransitionStyle = .crossDissolve
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
 */
