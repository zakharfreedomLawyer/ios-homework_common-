//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Захар Кисляк on 09.11.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    
    //UIStackView (логин, пароль, лейбл)
    
    private let commonInformationStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: Создаем кнопку ShowStatus(1)
    
    private let blueeButton: UIButton = {
        let buttonShowStatus = UIButton()
        buttonShowStatus.setTitle("Show status", for: .normal)
        buttonShowStatus.titleLabel?.textColor = .white
        buttonShowStatus.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonShowStatus.backgroundColor = .systemBlue
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
        let labelStatus = UILabel()
        labelStatus.text = "I am waiting eat..."
        labelStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelStatus.textColor = UIColor.gray
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        return labelStatus
    }()
    
    //MARK: Создаем лейбл - имя(4)
    
    private var labelNameCat: UILabel = {
        let labelName = UILabel()
        labelName.text = "Scottish shorthair"
        labelName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()
    
    //MARK: Создаем текстовое поле (5)
    
    private var catTextField: UITextField = {
        let textCat = UITextField()
        textCat.layer.borderColor = UIColor.black.cgColor
        textCat.layer.borderWidth = 1
        textCat.layer.cornerRadius = 10
        textCat.textColor = .black
        textCat.backgroundColor = .white
        textCat.textAlignment = .center
        textCat.placeholder = "What would you like?"
        textCat.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textCat.translatesAutoresizingMaskIntoConstraints = false
        return textCat 
    }()
    
    
    
    //MARK: Инициализаторы
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor  = .systemGray6
        config()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Методы
        
    
    //Метод для добавления вью
    
    private func config() {
        addSubview(blueeButton)
        addSubview(catAvatarImageView)
        addSubview(commonInformationStack)
       
       
        self.commonInformationStack.addArrangedSubview(labelNameCat)
        self.commonInformationStack.addArrangedSubview(labelStatusCat)
        self.commonInformationStack.addArrangedSubview(catTextField)
        
    
    }
    
    //Метод для констрейнтов
    
    private func setUpUI() {
        
        //MARK: Constraints
        
        NSLayoutConstraint.activate([
            
            //Constraint for button
        
            blueeButton.topAnchor.constraint(equalTo: catAvatarImageView.bottomAnchor, constant: 16),          
            blueeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            blueeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            blueeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            blueeButton.heightAnchor.constraint(equalToConstant: 50),

            
            //Constraint for avatar
            
            catAvatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            catAvatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            catAvatarImageView.heightAnchor.constraint(equalToConstant: 135),
            catAvatarImageView.widthAnchor.constraint(equalToConstant: 135),
            
            //Сonstraint for comonInformationStack
            
            commonInformationStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            commonInformationStack.heightAnchor.constraint(equalToConstant: 130),
            commonInformationStack.widthAnchor.constraint(equalToConstant: 200),
            commonInformationStack.leadingAnchor.constraint(equalTo: catAvatarImageView.trailingAnchor, constant: 16)
        ])
    }
} 
   
