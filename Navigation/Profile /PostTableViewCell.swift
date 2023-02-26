//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Захар Кисляк on 22.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    //Заголовок таблицы
    
    private let descriptionText: UILabel = {
        let previewText = UILabel()
        previewText.font = .systemFont(ofSize: 20, weight: .bold)
        previewText.numberOfLines = 2
        previewText.textColor = .black
        previewText.translatesAutoresizingMaskIntoConstraints = false
        return previewText
    }()
    
    //Фото для таблицы
    
    private let imageForCell: UIImageView = {
        let imageCell = UIImageView()
        imageCell.contentMode = .scaleAspectFit
        //imageCell.backgroundColor = .black
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        return imageCell
    }()
    
    //Лайки
    
    private let likesForTable: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        return likes
    }()
    
    //Описание поста
    
    private let descriptionForPost: UILabel = {
        let descriptionForPost = UILabel()
        descriptionForPost.textColor = .systemGray
        descriptionForPost.numberOfLines = 0
        descriptionForPost.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionForPost.textAlignment = .left
        descriptionForPost.translatesAutoresizingMaskIntoConstraints = false
        return descriptionForPost
    }()
    
    
    private let commonViews: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .regular)
        return views
    }()
    
    //Добавляем компоненты таблицы в инициализатор
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentMode = .scaleAspectFit
        backgroundColor = .white
        constraintsForCell()
        configuration()
    }

    
    
    func fillImage(text: String) {
        imageForCell.image = UIImage(named: text)
    }
    
    func fillauthor(author: String) {
        descriptionText.text = author
    }
    
    func filldescription(textForDesk: String) {
        descriptionForPost.text = textForDesk
    }
    
    func fillLikes(dataForLike: String) {
        likesForTable.text = dataForLike
    }
    
    func fillViews(dataForViews: String) {
        commonViews.text = dataForViews
    }
    
    //Constraints
    
    func constraintsForCell() {
            NSLayoutConstraint.activate([
                
                descriptionText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
                descriptionText.heightAnchor.constraint(equalToConstant: 20),
                
                imageForCell.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
                imageForCell.heightAnchor.constraint(equalTo: contentView.widthAnchor),
                imageForCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                imageForCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                
                descriptionForPost.topAnchor.constraint(equalTo: imageForCell.bottomAnchor, constant: 13),
                descriptionForPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                descriptionForPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                likesForTable.topAnchor.constraint(equalTo: descriptionForPost.bottomAnchor, constant: 20),
                likesForTable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                likesForTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                
                commonViews.topAnchor.constraint(equalTo: descriptionForPost.bottomAnchor, constant: 20),
                commonViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                commonViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            ])
        }
    
    func configuration() {
        contentView.addSubview(descriptionText)
        contentView.addSubview(imageForCell)
        contentView.addSubview(descriptionForPost)
        contentView.addSubview(likesForTable)
        contentView.addSubview(commonViews) 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
