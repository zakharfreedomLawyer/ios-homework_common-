//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Захар Кисляк on 09.11.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    
    //MARK: Свойства
    
    //MARK: Создаем кнопку ShowStatus(1)
    
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
        let userText = labelStatusCat.text
        print(userText ?? ("nil"))
    }
    
    //MARK: Создаем аватарку(2)
    
    private var catAvatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 135, height: 135))
        imageView.image = UIImage(named: "cateM")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor(ciColor: .white).cgColor
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: Создаем статус котика - лейбл(3)
    
    private var labelStatusCat: UILabel = {
        let labelStatus = UILabel(frame: CGRect(x: 20, y: 50, width: 30, height: 31))
        labelStatus.text = "I am waiting eat..."
        labelStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelStatus.textColor = UIColor.gray
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        return labelStatus
    }()
    
    //MARK: Создаем лейбл - имя(4)
    
    private var labelNameCat: UILabel = {
        let labelName = UILabel(frame: CGRect(x:200, y: 150, width: 50, height: 50))
        labelName.text = "Scottish shorthair"
        labelName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()
    
    //MARK: Создаем текстовое поле (5)
    
    private var catTextField: UITextField = {
        let textCat = UITextField(frame: CGRect(x: 100, y: 100, width: 70, height: 50))
        textCat.borderStyle = .roundedRect
        textCat.textColor = .lightGray
        textCat.placeholder = "What would you like?"
        textCat.isSecureTextEntry = true
        textCat.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        textCat.translatesAutoresizingMaskIntoConstraints = false

        return textCat 
    }()
      
    //MARK: Инициализаторы
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor  = .lightGray
        setUpUI()
    }
    
    //MARK: Методы
        
    func setUpUI() {
        
        addSubview(blueeButton)
        addSubview(catAvatarImageView)
        addSubview (labelNameCat)
        addSubview(labelStatusCat)
        addSubview(catTextField)
       
        
    
        //MARK: Constraints
        
        NSLayoutConstraint.activate([
            
            //Constraint for button
        
            blueeButton.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),
            blueeButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            blueeButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
    
            //Constraint for avatar
            
            catAvatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            catAvatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            catAvatarImageView.heightAnchor.constraint(equalToConstant: 135),
            catAvatarImageView.widthAnchor.constraint(equalToConstant: 135),
            
            //Constraint for label
            
            labelNameCat.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            labelNameCat.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 158),
    
            //Constraint for label-2
            
            labelStatusCat.bottomAnchor.constraint(equalTo: blueeButton.topAnchor, constant: -50),
            labelStatusCat.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            labelStatusCat.topAnchor.constraint(equalTo: labelNameCat.bottomAnchor, constant: 16),
            
            //Constraint for textField
            catTextField.bottomAnchor.constraint(equalTo: blueeButton.topAnchor, constant: -16),
            catTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            catTextField.topAnchor.constraint(equalTo: labelStatusCat.bottomAnchor, constant: 16),
            catTextField.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
