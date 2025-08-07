//
//  FilmRepository.swift
//  Repository
//
//  Created by Hg Q. on 7/21/19.
//

import Foundation

open class FilmRepository {
    
    fileprivate var gr: GenericItemRepository!
    
    public init(_ database: Database) {
        self.gr = GenericItemRepository(database)
    }
    
    public func add(_ object: Film) {
        gr.add(object)
    }
    
    public func update(_ object: Film) {
        gr.update(object)
    }
    
    public func delete(_ object: Film) {
        gr.delete(object)
    }
    
    func object(forPrimaryKey key: String) -> Film {
        return gr.object(ofType: Film.self, forPrimaryKey: key) as! Film
    }
}
