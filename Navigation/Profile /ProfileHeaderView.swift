//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Захар Кисляк on 09.11.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
   let lightGrayView = UIView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(lightGrayView) 
    
        self.backgroundColor  = .lightGray
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
         imageView.translatesAutoresizingMaskIntoConstraints = false
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

     addSubview(blueeButton)
     addSubview(catAvatarImageView)
    addSubview (textFieldShowStatus)
    addSubview (labelNameCat)
          
   //MARK: Constrains
        
        // Constrains for image
        
        NSLayoutConstraint.activate([
  
            catAvatarImageView.leftAnchor.constraint(equalTo: lightGrayView.leftAnchor, constant: 16),
            catAvatarImageView.topAnchor.constraint(equalTo: lightGrayView.topAnchor, constant: 16),
           catAvatarImageView.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),
           catAvatarImageView.bottomAnchor.constraint(equalTo: blueeButton.topAnchor, constant: -16)
          ])
          
           // Constrains for button
        
        NSLayoutConstraint.activate([
           
            blueeButton.leadingAnchor.constraint(equalTo: lightGrayView.leadingAnchor, constant: 16),
            blueeButton.rightAnchor.constraint(equalTo: lightGrayView.rightAnchor, constant: -16),
           blueeButton.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),
           blueeButton.heightAnchor.constraint(equalTo: blueeButton.heightAnchor, constant: 50),
           blueeButton.topAnchor.constraint(equalTo: textFieldShowStatus.bottomAnchor, constant: 34)
        ])  
        
        // Constrains for textfield
        
        NSLayoutConstraint.activate([
            textFieldShowStatus.trailingAnchor.constraint(equalTo: lightGrayView.trailingAnchor, constant: -60),
           textFieldShowStatus.leftAnchor.constraint(equalTo: catAvatarImageView.rightAnchor, constant: 16)
        ])
        
        // Constrains for label
       NSLayoutConstraint.activate([ 
           labelNameCat.bottomAnchor.constraint(equalTo: textFieldShowStatus.topAnchor, constant: -20),
          labelNameCat.leftAnchor.constraint(equalTo: catAvatarImageView.rightAnchor, constant: 16),
           labelNameCat.trailingAnchor.constraint(equalTo: labelNameCat.trailingAnchor, constant: 27),
       ])
        
    }

 

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
} 
 
