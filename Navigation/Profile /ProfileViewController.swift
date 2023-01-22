//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit


class ProfileViewController: UIViewController {

   //MARK: Свойства
   
  var profileHeaderView = ProfileHeaderView()
    
    //Создаем таблицу
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SecondCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewController")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemPink
        return tableView
    }()
    
    //MARK: Create identifire
    
    let identifire = "Mani"
    
//MARK: -Добавляем констрейнт для HeaderView

func setUpUIConstrainsts() {
 
    view.addSubview(tableView)
    
   NSLayoutConstraint.activate([
    
       //Constraint for tableView
       
    //tableView.topAnchor.constraint(equalTo: view.topAnchor),
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), 

      ])
   }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .lightGray
          profileHeaderView.backgroundColor = .lightGray
          profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(profileHeaderView)
          self.title = "Profile"
          self.navigationController?.navigationBar.backgroundColor = .white
          setUpUIConstrainsts()
     }
}
    //MARK: Расширение для DataSource

    extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataForCells.count
        }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewController", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath)
                return cell
            }
            cell.fillImage(text: dataForCells[indexPath.row].imageName)
            cell.fillauthor(author: dataForCells[indexPath.row].author)
            cell.filldescription(textForDesk: dataForCells[indexPath.row].description)
            cell.fillLikes(dataForLike: "Likes: \(dataForCells[indexPath.row].likes)")
            cell.fillViews(dataForViews: "Views: \(dataForCells[indexPath.row].view)")
        
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataForCells.count
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 240
        }
        
        //MARK: Функция для заголовка таблицы
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          "Profile"
        }
        
        //MARK: Функция для "подвала" таблицы
        
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            "Title2"
        }
    }

