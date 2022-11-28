//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Захар Кисляк on 09.11.2022.
//

import UIKit


class ProfileHeaderView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor  = .lightGray
        setUpUI()   
}
    
    //MARK: Создаем кнопку ShowStatus
    
    private let blueeButton: UIButton = {
        let buttonShowStatus = UIButton(frame: CGRect(x: 16, y: 300, width: 355,  height: 50))
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
        buttonShowStatus.addTarget(self, action:   #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        return buttonShowStatus
    } ()
     
    @objc func buttonPressed (sender:UIButton) {
     let userText = textFieldShowStatus.text
        print(userText ?? ("nil"))
     }
    
    //MARK: Создаем аватарку
     
     private lazy var catAvatarImageView: UIImageView = {
         let imageView = UIImageView(frame: CGRect(x: 16, y: 110, width: 135, height: 135))
         imageView.image = UIImage(named: "catMaria")
         imageView.layer.borderWidth = 3
         imageView.layer.borderColor = UIColor(ciColor: .white).cgColor
         imageView.layer.cornerRadius = imageView.frame.size.width / 2
         imageView.clipsToBounds = true
         //imageView.translatesAutoresizingMaskIntoConstraints = false
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.gray
        return textField
    }()
    
    //MARK: Создаем лейбл
     
     private var labelNameCat: UILabel = {
         let labelName = UILabel(frame: CGRect(x: 200, y: 150, width: 50, height: 50))
         labelName.text = "Scottish shorthair"
         labelName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         labelName.translatesAutoresizingMaskIntoConstraints = false
         return labelName
     }()
    
    
    //MARK: Дополнительное View для Navigation Bar
    
    private var whiteView: UIView {
        let whiteViewBar = UIView()
        whiteViewBar.backgroundColor = .white
        whiteViewBar.frame = CGRect(x: 0, y: 0, width: 400, height: 47)
        return whiteViewBar
    }
     
    //MARK: Функция,которая отвечает за добавление элементов
    
    func setUpUI() {

    addSubview(blueeButton)
    addSubview(catAvatarImageView)
    addSubview (textFieldShowStatus)
    addSubview (labelNameCat)
    addSubview(whiteView)
         
        
    //MARK: Constraints
        
        //Constraint for button
        
        NSLayoutConstraint.activate([
            blueeButton.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),
            blueeButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            blueeButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])

        //Constraint for avatar
        
        NSLayoutConstraint.activate([
            catAvatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -16),
            catAvatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
    
        ])
        
        //Constraint for label
        
        NSLayoutConstraint.activate([
            labelNameCat.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            labelNameCat.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 158)
        ])
        
        //Constraint for textfield
        
        NSLayoutConstraint.activate([
            textFieldShowStatus.bottomAnchor.constraint(equalTo: blueeButton.topAnchor, constant: -34),
            textFieldShowStatus.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
