//
//  InfoViewController .swift
//  Navigation
//
//  Created by Захар Кисляк on 30.10.2022.
//

import UIKit


final class InfoViewController:UIViewController {
    
    private var buttonThird: UIButton = {
        let infoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        infoButton.backgroundColor = .white
        infoButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return infoButton
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .orange
        
        self.view.addSubview(self.buttonThird)
        self.buttonThird.center = self.view.center
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Ура!", message: "Домашняя работа выполнена", preferredStyle: .actionSheet)
        print("Домашняя работа выполнена")
        
        let firstAction = UIAlertAction(title: "First action", style: .default) { _ in
            print("Первое действие")
        }
        let secondAction = UIAlertAction(title: "Second action", style: .destructive) { _ in
            print("Второе действие")
        } 
            alertController.addAction(firstAction)
            alertController.addAction(secondAction)
            
        self.present(alertController, animated: true, completion: nil)
    }
}



