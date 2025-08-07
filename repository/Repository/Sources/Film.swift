//
//  Film.swift
//  UnitOfWork
//
//  Created by Hg Q. on 7/11/19.
//

import RealmSwift
import Foundation

open class Film: BaseObject {
    
    @objc dynamic var title: String? = ""
    @objc dynamic var director: String = ""
    @objc dynamic var pos: Double = -1
    
    public convenience init(id: String, title: String, director: String, pos: Double) {
        self.init()
        self.id = id
        self.title = title
        self.director = director
        self.pos = pos
    }
}
