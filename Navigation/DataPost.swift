//
//  DataPost.swift
//  Navigation
//
//  Created by Захар Кисляк on 23.10.2022.
//

import UIKit 

//MARK: модель публикации №1

struct Post {
    var title:String
    var description:String
}
 
//MARK: модель публикации №2

struct PostIntable {
    var author: String
    var description: String
    var imageName: String
    var likes:Int
    var view: Int 
}

var dataForCells: [PostIntable] {
    
    //1
    return [PostIntable(author: "Britain's Family", description: "", imageName: "dragon", likes: 11909, view: 23198)
    ]
}
