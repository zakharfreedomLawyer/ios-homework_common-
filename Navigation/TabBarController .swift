//
//  TabBarController .swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit


 final class TabBarController: UITabBarController {
    
    // MARK: создаем два экрана просмотров(новости и профиль)
    
    var feedViewController: UINavigationController!
    var profileViewController: UINavigationController!
     
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setUpController() 
    }
    
    private func setUpController() {
        feedViewController = UINavigationController.init(rootViewController: FeedViewController())
        profileViewController = UINavigationController.init(rootViewController: ProfileViewController())
        
        self.viewControllers = [feedViewController, profileViewController]
        
    // MARK: создаем ячейки
        
        let itemFeed = UITabBarItem(title: "News", image:UIImage(systemName: "folder"), tag: 0)
        let itemProfile = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        
        feedViewController.tabBarItem = itemFeed 
        profileViewController.tabBarItem = itemProfile
        
        
    // MARK: настройка кнопок в ячейках
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .gray 
    }
}
