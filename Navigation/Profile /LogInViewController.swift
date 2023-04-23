//
//  LogInViewController.swift
//  Navigation
//
//  Created by Захар Кисляк on 25.12.2022.
//

import UIKit
import StorageService


class LogInViewController: UIViewController {
    
    //MARK: -Свойства
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    //Картинка-логотип
    
    private let logoVkLabel: UIImageView = {
        let labelVK = UIImageView()
        labelVK.image = UIImage(named: "logo")
        labelVK.layer.borderColor = UIColor(ciColor: .white).cgColor
        labelVK.translatesAutoresizingMaskIntoConstraints = false
        return labelVK
    }()
    
    
    //Кнопка авторизации
    
    private lazy var autorizationButton: UIButton = {
        let authButton = UIButton()
        authButton.setTitle("Log in", for: .normal)
        let backGroundImage = UIImage(named: "blue_pixel-2")
        let firstBackGroundImage = backGroundImage?.image(alpha: 1)
        let secondBackGroundImage = backGroundImage?.image(alpha: 0.8)
        authButton.setBackgroundImage(firstBackGroundImage, for: .normal)
        authButton.setBackgroundImage(secondBackGroundImage, for: .selected)
        authButton.setBackgroundImage(secondBackGroundImage, for: .highlighted)
        authButton.setBackgroundImage(secondBackGroundImage, for: .disabled)
        authButton.translatesAutoresizingMaskIntoConstraints = false
        authButton.clipsToBounds = true
        authButton.tintColor = .white
        authButton.layer.cornerRadius = 10
        authButton.titleLabel?.textColor = .white
        authButton.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        return authButton
    }()
        
    //Поле Логин
    
    private var logInTextField: UITextField = {
        let logInTextField = UITextField()
        logInTextField.textColor = .black
        logInTextField.translatesAutoresizingMaskIntoConstraints = false
        logInTextField.layer.borderColor = UIColor.lightGray.cgColor
        logInTextField.font = .systemFont(ofSize: 16, weight: .regular)
        logInTextField.placeholder = "Email or phone"
        logInTextField.textAlignment = .left
        logInTextField.leftViewMode = .always
        logInTextField.backgroundColor = .systemGray6
        logInTextField.keyboardType = .emailAddress
        logInTextField.keyboardAppearance = .alert
        logInTextField.autocapitalizationType = .none
        return logInTextField
    }()
    
    //Поле пароль
    
    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 10
        password.font = .systemFont(ofSize: 16, weight: .regular)
        password.placeholder = "Password"
        password.backgroundColor = .systemGray6
        password.textAlignment = .left
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.keyboardType = .numberPad
        password.keyboardAppearance = .alert
        password.translatesAutoresizingMaskIntoConstraints = false
        password.clearButtonMode = .whileEditing
        return password
    }()
    
    //MARK: Общий стэк с паролем и логином
    
    private let commonStackLoginPassword: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.contentMode = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        return stackView
    }()

    
    //MARK: -Инициализаторы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gestureRecognizes()
        view.backgroundColor = UIColor.white
        setUp()
        
    }
    
    
    //MARK: -Методы
 
    func setUp() {
        view.addSubview(scrollView)
        commonStackLoginPassword.addArrangedSubview(self.logInTextField)
        commonStackLoginPassword.addArrangedSubview(self.passwordTextField)
        commonStackLoginPassword.addArrangedSubview(self.autorizationButton)
        scrollView.addSubview(logoVkLabel)
        scrollView.addSubview(commonStackLoginPassword)
       
        NSLayoutConstraint.activate([
            
            //MARK: Constraint for logoVK

            logoVkLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoVkLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoVkLabel.widthAnchor.constraint(equalToConstant: 100),
            logoVkLabel.heightAnchor.constraint(equalToConstant: 100),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //MARK: Constraint for buttonAuthorization
            
            autorizationButton.topAnchor.constraint(equalTo: commonStackLoginPassword.bottomAnchor, constant: 16),
            autorizationButton.heightAnchor.constraint(equalToConstant: 50),
            autorizationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            autorizationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            autorizationButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 66), 
        
           
            //MARK: Constraint for scrollView
            
           scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
           scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
           scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            //MARK: Constraint for stack
            
          commonStackLoginPassword.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
          commonStackLoginPassword.trailingAnchor.constraint(equalTo:  scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
          commonStackLoginPassword.topAnchor.constraint(equalTo: logoVkLabel.bottomAnchor, constant: 120),
          commonStackLoginPassword.heightAnchor.constraint(equalToConstant: 180),
            
        ])
    }
    

    //MARK: Gesture Recognizes
    
    private func gestureRecognizes() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func forcedHidingKeyBoard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
    // Функция на кнопку для открытия следующей страницы
    
    @objc func openProfile() {
        let profileView = ProfileViewController()
        navigationController?.pushViewController(profileView, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           super.touchesBegan(touches, with: event)
           view.endEditing(true)
           scrollView.endEditing(true)
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height

        let loginButtonBottomPointY = self.commonStackLoginPassword.frame.origin.y + self.autorizationButton.frame.origin.y + self.autorizationButton.frame.height
        let keyboardOriginY = self.view.frame.height - keyboardHeight

        let yOffset = keyboardOriginY < loginButtonBottomPointY
        ? loginButtonBottomPointY - keyboardOriginY + 16
        : 0

        self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
    }
}

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
   }
}

    extension UIImage {
        func image(alpha: CGFloat) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(at: .zero, blendMode: .normal, alpha: alpha)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage
        }
    }

 
