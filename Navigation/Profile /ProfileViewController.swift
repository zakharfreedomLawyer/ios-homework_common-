//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit

 class ProfileViewController: UIViewController { 
    
    //MARK: Свойства
    
   var profileHeaderView = ProfileHeaderView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        profileHeaderView.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
    
   }
     
      
    override func viewDidLayoutSubviews() {
        profileHeaderView.frame = view.frame 
    }
}

