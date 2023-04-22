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
    return [
            PostIntable(author: "House of the dragon", description: "The reign of House Targaryen begins: House of the Dragon, the prequel to Game of Thrones, is here. Based on George R.R. Martin’s “Fire & Blood,” the series, which is set 200 years before the events of Game of Thrones, tells the story of House Targaryen", imageName: "dragon", likes: 11909, view: 26175),
            PostIntable(author: "The Mandalorian", description: "The Mandalorian is an American space Western television series created by Jon Favreau for the streaming service Disney+. It is the first live-action series in the Star Wars franchise, beginning five years after the events of Return of the Jedi (1983), and stars Pedro Pascal as the title character, a lone bounty hunter who goes on the run to protect the Force-sensitive child Grogu", imageName: "Mando", likes: 8848, view: 25412),
            PostIntable(author: "The book of Boba Fett", description: "The Book of Boba Fett is an American space Western television mini-series created by Jon Favreau for the streaming service Disney+. It is part of the Star Wars franchise and a spin-off from the series The Mandalorian, taking place in the same timeframe as that series and its other interconnected spin-offs after the events of Return of the Jedi (1983). The Book of Boba Fett follows bounty hunter Boba Fett from The Mandalorian and other Star Wars media as he establishes himself as the new crime lord of Jabba the Hutt's former territory.",  imageName: "Bob", likes: 4535, view: 5001),
            PostIntable (author: "The last of us", description: "After a global pandemic destroys civilization, a hardened survivor takes charge of a 14-year-old girl who may be humanity’s last hope. Pedro Pascal and Bella Ramsey star as Joel and Ellie. Gabriel Luna (True Detective) as Joel’s younger brother and former soldier, Tommy; Merle Dandridge as resistance leader Marlene; and Anna Torv as Tess, a smuggler and fellow hardened survivor.", imageName: "The last", likes: 4355, view: 6325)
    ]
    
    
}
