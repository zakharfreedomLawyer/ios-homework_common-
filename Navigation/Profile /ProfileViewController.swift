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
   
     //MARK: -Добавляем кнопку changetitle
     
     private let changeTitleButton: UIButton = {
         let titleButton = UIButton(frame: CGRect(x: 0, y:0, width: 355, height: 50))
         titleButton.setTitle("Change title", for: .normal)
         titleButton.titleLabel?.textColor = .white
         titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
         titleButton.backgroundColor = .darkGray
         titleButton.layer.cornerRadius = 4
         titleButton.layer.shadowOpacity = 0.7
         titleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
         titleButton.layer.shadowRadius = 4
         titleButton.layer.shadowColor = UIColor.black.cgColor
         titleButton.translatesAutoresizingMaskIntoConstraints = false
         return titleButton
     }()
     
     
   override func viewDidLayoutSubviews() {
   }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .lightGray
         profileHeaderView.backgroundColor = .lightGray
         profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(profileHeaderView)
         self.title = "Profile"
         self.navigationController?.navigationBar.backgroundColor = .white
         setUpUIConstrainsts()
    }

//MARK: -Добавляем констрейнт для HeaderView

func setUpUIConstrainsts() {
    view.addSubview(profileHeaderView)
    view.addSubview(changeTitleButton)
    
    NSLayoutConstraint.activate([
        
        //Constraint for ProfileHeaderView
        
        profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
        profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        
        
        //Constraint for button changeTitle
        changeTitleButton.leftAnchor.constraint(equalTo: view.leftAnchor),
        changeTitleButton.rightAnchor.constraint(equalTo: view.rightAnchor),
        changeTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        changeTitleButton.heightAnchor.constraint(equalToConstant: 30) 
    ])
    } 
 }



