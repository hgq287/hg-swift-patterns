//
//  Film.swift
//  UnitOfWork
//
//  Created by Hg Q. on 7/11/19.
//

import Foundation

public struct Film: Equatable {
    
    public let id: String
    public let title: String
    public let director: String
    public let pos: Double
    
    public init(id: String, title: String, director: String) {
        self.id = id
        self.title = title
        self.director = director
        self.pos = -1.0 // Initialize pos with a default value
    }
}
