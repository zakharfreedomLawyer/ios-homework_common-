//
//  PostViewController .swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit

 final class PostViewController: UIViewController {
     
     private lazy var nextButton: UIButton = {
        let button = UIButton()
         button.setTitle("Миссия выполнена", for: .normal)
         button.setTitleColor(UIColor.orange, for: .normal)
         return button
     }()
     
     override func viewDidLoad() {
      super.viewDidLoad()
         view.backgroundColor = .lightGray
         view.addSubview(nextButton)
         nextButton.frame = CGRect(x: 80, y: 100, width: 100, height: 300)
         nextButton.titleLabel?.numberOfLines = 3
         nextScreen() 
     }
     
     func nextScreen() {
         nextButton.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
     }

     @objc func addTarget() {
     let infoViewController = InfoViewController()
    nextButton.inputViewController?.modalPresentationStyle = .fullScreen
         self.present(infoViewController, animated: true)
   //   navigationController?.pushViewController(infoViewController, animated: true)
     }
 }
