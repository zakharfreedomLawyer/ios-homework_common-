//
//  TabBarController .swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit


 final class TabBarController: UITabBarController {
    
    // MARK: создаем два экрана просмотров(новости и профиль)
    
    var newsViewController: UINavigationController!
    var profileViewController: UINavigationController!
     
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setUpController() 
    }
    
    private func setUpController() {
        newsViewController = UINavigationController.init(rootViewController: NewsViewController())
        profileViewController = UINavigationController.init(rootViewController: ProfileViewController())
        
        self.viewControllers = [newsViewController, profileViewController]
        
    // MARK: создаем ячейки
        
        let itemNews = UITabBarItem(title: "News", image:UIImage(systemName: "folder"), tag: 0)
        let itemProfile = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        
        newsViewController.tabBarItem = itemNews
        profileViewController.tabBarItem = itemProfile
        
        
    // MARK: настройка кнопок в ячейках
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .gray 
    }
}
