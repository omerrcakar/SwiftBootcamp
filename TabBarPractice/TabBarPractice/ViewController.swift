//
//  ViewController.swift
//  TabBarPractice
//
//  Created by ÖMER  on 14.02.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let tabItems = tabBarController?.tabBar.items{
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            
            anasayfaItem.badgeValue = "3"
            ayarlarItem.badgeValue = "New"
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemGray
        appearance.shadowColor = .lightGray
        
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    
    func changeColor(itemAppearance: UITabBarItemAppearance){
        // Seçili
        itemAppearance.selected.iconColor = .red
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
        itemAppearance.selected.badgeBackgroundColor = .red
        itemAppearance.selected.badgeTextAttributes = [.foregroundColor: UIColor.white]
        // Seçili değil
        itemAppearance.normal.iconColor = .white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        itemAppearance.normal.badgeBackgroundColor = .white
        itemAppearance.normal.badgeTextAttributes = [.foregroundColor: UIColor.red]
    }


}

