//
//  FeedViewController.swift
//  Navigation 
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit
import StorageService
import SnapKit

final class FeedViewController: UIViewController {
    
    //MARK: Свойства
    
    var dataSource = Post(title: "Feed cat", description:"Description")

    private let showPostButton:UIButton = {
        let button = UIButton()
        button.setTitle("Покормить котика", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    } ()
    
    var imageCat = UIImage(named: "cat-2")
    var cateView = UIImageView()
    


   override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .magenta
       view.addSubview(showPostButton)
       showPostButton.frame = CGRect(x: 100, y: 500, width: 150, height: 50)
       showPostButton.setTitle(dataSource.title, for: .normal)
       showPostButton.setTitle("I am pressed", for: .highlighted)
       showPostButton.layer.cornerRadius = 5
       showPostButton.layer.borderWidth = 3.0
       showPostButton.layer.borderColor = (UIColor(displayP3Red: 242.0/255.0, green: 116.0/255.0, blue: 119.0, alpha: 1.0)).cgColor
       showPostButton.clipsToBounds = true
       
       showPostButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchDown)
       showPostButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchUpInside)
      
       //MARK: Картинка
       cateView = UIImageView(frame: CGRect(x: 30, y: 60, width: 50, height: 30))
       cateView.contentMode = .redraw
       cateView.layer.cornerRadius = 30
       cateView.clipsToBounds = true
       cateView.image = imageCat
       cateView.sizeToFit()
       view.addSubview(cateView)
       addTarget()
       addAnchors()
   }

    
    // метод показывает, что кнопка нажата
    @objc private func buttonIsPressed(sender:UIButton) {
        print("Button is pressed")
    }
    
    @objc private func buttonIsTapped(sender:UIButton) {
        print("Button is pressed")
    }
    
   private func addTarget() {
     showPostButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
    }
    
    @objc private func changeViewController() { 
        let postViewController = PostViewController()
       navigationController?.pushViewController(postViewController, animated: true)
   }
    //MARK: -Ограничения для кнопки
    
      func addAnchors() {
        cateView.snp.makeConstraints() { make in
            make.top.equalTo(24)
            make.trailing.equalTo(18)
            make.leading.equalTo(-18)
        }
          showPostButton.snp.makeConstraints { make in
              make.top.equalTo(cateView.snp.bottom).inset(-22)
              make.center.equalToSuperview()
              make.height.equalTo(60)
              make.width.equalTo(100)
              
          }
    }
}
 
