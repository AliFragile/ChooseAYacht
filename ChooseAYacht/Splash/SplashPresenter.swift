//
//  SplashPresenter.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 05.01.2023.
//

import UIKit

protocol SplashPresenterDescription {
    func present()
    func dismiss(completion: (() -> Void)?)
}

final class SplashPresenter: SplashPresenterDescription {
    
    private lazy var foregroundSplashWindow: UIWindow = {
        let splashWindow = UIWindow()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let splashViewController = storyboard.instantiateViewController(identifier: "SplashViewController") as? SplashViewController
        
        splashWindow.windowLevel = .normal + 1      //будет находиться на 1 уровень выше, чем главное окно                                          приложения
        splashWindow.rootViewController = splashViewController
        
        return splashWindow
    }()
    
    func present() {
        foregroundSplashWindow.isHidden = false
        
        let splashViewController = foregroundSplashWindow.rootViewController as? SplashViewController
        
        // убираю картинки текста и яхты, чтобы не было видно
        splashViewController?.textImageView.transform = CGAffineTransform(translationX: 500, y:300)
        splashViewController?.yachtImageView.transform = CGAffineTransform(translationX: 200, y: 0)
        // анимация
        UIView.animate(withDuration: 5) {
//            splashViewController?.textImageView?.transform = .identity
//            splashViewController?.yachtImageView?.transform = .identity
            splashViewController?.textImageView?.frame.origin.y += 350
            splashViewController?.textImageView?.frame.origin.x += 400
        }
//        UIImageView.animate(withDuration: 5, animations: {
//            splashViewController?.textImageView?.frame.origin.y += 350
//            splashViewController?.textImageView?.frame.origin.x += 400
//            splashViewController?.textImageView?.transform.translatedBy(x: 350, y: 200)
//        })
        
        splashViewController?.textImageView.alpha = 0
        UIView.animate(withDuration: 1) {
            splashViewController?.textImageView.alpha = 1
        }
    }
    
    func dismiss(completion: (() -> Void)?) {
        UIView.animate(withDuration: 10) {
            self.foregroundSplashWindow.alpha = 0
        } completion: { (_) in
            completion?()           //чтобы в AppDelegate освободилось это свойство
        }
    }
}
/*
 UIImageView.animate(withDuration: 7, animations: {
     self.image.frame.origin.y += 350
     self.image.frame.origin.x += 400
     self.image.transform = CGAffineTransform(rotationAngle: 0).scaledBy(x: 300, y: 300)
     
     //.translatedBy(x: , y: ) - перемещение
     self.image.alpha = 0.5
 }) { _ in
     UIImageView.animate(withDuration: 5) {
         self.image.frame.origin.y += 200
         self.image.frame.origin.x -= 200
         
         self.image.alpha = 1
         self.label.alpha = 1
     }
 }
 */
