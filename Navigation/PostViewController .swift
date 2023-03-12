//
//  PostViewController .swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit

 final class PostViewController: UIViewController {
     

     override func viewDidLoad() {
      super.viewDidLoad()
         view.backgroundColor = .lightGray
        let nextScreen = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeScreen))
        navigationItem.rightBarButtonItem = nextScreen
     }
     
     // MARK: Переход на следующий экран
     
    @objc func changeScreen() {
      let infoViewController = InfoViewController()
         navigationController?.inputViewController?.modalPresentationStyle = .fullScreen
         self.present(infoViewController, animated: true)
     }
 }

 
