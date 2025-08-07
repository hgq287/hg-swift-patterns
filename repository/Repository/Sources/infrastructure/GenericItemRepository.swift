//
//  GenericItemRepository.swift
//  Repository
//
//  Created by Hg Q. on 7/21/19.
//

import Foundation

open class GenericItemRepository: IBaseRepository {
    
    //static var si = GenericItemRepository()
    
    typealias T = BaseObject
    
    let db: Database
    
    init(_ database: Database) {
        self.db = database
    }
    
    // MARK: - IBaseRepository Implementations
    
    func add(_ object: BaseObject) {
        db.add(object)
    }
    
    func update(_ object: BaseObject) {
        db.update(object)
    }
    
    func delete(_ object: BaseObject) {
        db.delete(object)
    }
    
    func object(ofType type: AnyClass, forPrimaryKey key: String) -> BaseObject {
        return db.object(ofType: type, forPrimaryKey: key) as! BaseObject
    }
}
