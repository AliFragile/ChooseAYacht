//
//  ViewController.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 20.12.2022.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet var yachtButton: UIButton!
    @IBOutlet var jetskiButton: UIButton!
    
    let index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        goToYachtViewController()
        goToJetskiViewController()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = true
//    }

    
    @IBAction func goToYachtViewController() {
//        guard let newViewController = storyboard?.instantiateViewController(withIdentifier: "YachtViewController") else  { return }
//        show(newViewController, sender: nil)
        
        //self.performSegue(withIdentifier: "ShowYachtVC", sender: nil)
        
        guard let tabBarController = storyboard?.instantiateViewController(identifier: "TabBarID") else { return }
        
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
        
        //tabBar.selectedItem = tabBar.items?.first as? UITabBarItem
        //myTabBar.selectedItem = myTabBar.items![0]
        
//         guard let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "YachtViewController") else { return }
//         newViewController.modalTransitionStyle = .crossDissolve
//         newViewController.modalPresentationStyle = .fullScreen
//         self.show(newViewController, sender: nil)
        
    }
    
    /*
     let kIndexHorseViewController = 0 //<-Change this to the actual index
         
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             switch segue.identifier {
             case "horseViewerSegue":
                 let tabBarVC = segue.destination as! UITabBarController
                 let horseVC = tabBarVC.viewControllers![kIndexHorseViewController] as! HorseViewController
                 horseVC.horsePassed = horseSelected
                 tabBarVC.selectedIndex = kIndexHorseViewController
             default:
                 print("Unknown segue: \(segue.identifier ?? "nil")")
             }
         }
     */
    
    @IBAction func goToJetskiViewController() {
//        guard let newViewController = storyboard?.instantiateViewController(withIdentifier: "JetskiViewController") else  { return }
//        show(newViewController, sender: nil)
        
        //self.performSegue(withIdentifier: "ShowJetskiVC", sender: nil)
        
//        guard let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "JetskiViewController") else { return }
//        newViewController.modalTransitionStyle = .crossDissolve
//        newViewController.modalPresentationStyle = .fullScreen
//        self.show(newViewController, sender: nil)
        
        guard let tabBarController = storyboard?.instantiateViewController(identifier: "Two") else { return }
                    tabBarController.modalPresentationStyle = .fullScreen
                    present(tabBarController, animated: true, completion: nil)
    }
    
  
//        let viewController = YachtViewController()
//        viewController.modalTransitionStyle = .crossDissolve
//        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: true)
        
       // self.performSegue(withIdentifier: "ShowYachtVC", sender: nil)

//        guard let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "YachtViewController") else { return }
//        self.show(newViewController, sender: nil)
    

    
//        let viewController = JetSkiViewController()
//        viewController.modalTransitionStyle = .crossDissolve
//        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: true)
        
        //self.performSegue(withIdentifier: "ShowJetskiVC", sender: nil)

//        guard let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "JetskiViewController") else { return }
//        self.show(newViewController, sender: nil)
    
}

