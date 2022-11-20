//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit

 final class ProfileViewController: UIViewController {
    
    //MARK: Свойства
    
   let profileHeaderView = ProfileHeaderView()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileHeaderView)
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
    
        setUpUI()
    }
     

     //MARK: Создаем кнопку ShowStatus
     
     private let blueeButton: UIButton = {
     let buttonShowStatus = UIButton(frame: CGRect(x: 32, y: 250, width: 300, height: 50))
         
         buttonShowStatus.setTitle("Show status", for: .normal)
         buttonShowStatus.titleLabel?.textColor = .white
         buttonShowStatus.titleLabel?.font = UIFont.systemFont(ofSize: 18)
         buttonShowStatus.backgroundColor = .blue
         buttonShowStatus.layer.cornerRadius = 4
         buttonShowStatus.layer.shadowOpacity = 0.7
         buttonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
         buttonShowStatus.layer.shadowRadius = 4
         buttonShowStatus.layer.shadowColor = UIColor.black.cgColor
         buttonShowStatus.translatesAutoresizingMaskIntoConstraints = false
         
         buttonShowStatus.setTitle("I am pressed", for: .highlighted)
         buttonShowStatus.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
         return buttonShowStatus
     } ()
     
     @objc func buttonPressed (sender:UIButton) {
      let userText = textFieldShowStatus.text
         print(userText ?? ("nil"))
      }
     
     
    //MARK: Создаем аватарку
     
     private lazy var catAvatarImageView: UIImageView = {
         let imageView = UIImageView(frame: CGRect(x: 16, y: 100, width: 135, height: 135))
         imageView.image = UIImage(named: "catMaria")
         imageView.layer.borderWidth = 3
         imageView.layer.borderColor = UIColor(ciColor: .white).cgColor
         imageView.layer.cornerRadius = imageView.frame.size.width / 2
         imageView.clipsToBounds = true
         return imageView
     }()
     
     //MARK: Создаем текствое поле
     
     private var textFieldShowStatus: UITextField = {
         let textField = UITextField(frame: CGRect(x: 20, y: 150, width: 30, height: 50))
         textField.borderStyle = UITextField.BorderStyle.none
         textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
         textField.placeholder = "I am waiting eat..."
         textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         textField.backgroundColor = .lightGray
         textField.textColor = UIColor.gray
         textField.translatesAutoresizingMaskIntoConstraints = false
         
         return textField
     }()
     
     
    //MARK: Создаем лейбл
     
     private var labelNameCat: UILabel = {
         let labelName = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
         labelName.text = "Scottish shorthair"
         labelName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         labelName.translatesAutoresizingMaskIntoConstraints = false
         
         return labelName
     }()
     
     
     //MARK: Функция,которая отвечает за добавление элементов
     
     func setUpUI() {
         view.addSubview(blueeButton)
         view.addSubview(catAvatarImageView)
         view.addSubview(textFieldShowStatus)
         view.addSubview(labelNameCat)
         
         
         
    //MARK: Constrains
         
         // Constrains for image
         
         NSLayoutConstraint.activate([
   
            catAvatarImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            catAvatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            catAvatarImageView.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),
            catAvatarImageView.bottomAnchor.constraint(equalTo: blueeButton.topAnchor, constant: -16)
           ])
         
            // Constrains for button
         
         NSLayoutConstraint.activate([
            
            blueeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blueeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            blueeButton.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),
            blueeButton.heightAnchor.constraint(equalTo: blueeButton.heightAnchor, constant: 50),
            blueeButton.topAnchor.constraint(equalTo: textFieldShowStatus.bottomAnchor, constant: 34)
         ])
         
         // Constrains for textfield
         
         NSLayoutConstraint.activate([
            textFieldShowStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            textFieldShowStatus.leftAnchor.constraint(equalTo: catAvatarImageView.rightAnchor, constant: 16)
         ])
         
         // Constrains for label
        NSLayoutConstraint.activate([
            labelNameCat.bottomAnchor.constraint(equalTo: textFieldShowStatus.topAnchor, constant: -20),
           labelNameCat.leftAnchor.constraint(equalTo: catAvatarImageView.rightAnchor, constant: 16),
            labelNameCat.trailingAnchor.constraint(equalTo: labelNameCat.trailingAnchor, constant: 27),
        ])
         
     }
     
     
     
    
    override func viewDidLayoutSubviews() {
        profileHeaderView.frame = view.frame
  
    }
}
