//
//  IBaseRepository.swift
//  Repository
//
//  Created by Hg Q. on 7/21/19.
//

import Foundation

protocol IBaseRepository {
    
    associatedtype T
    
    func add(_ object: T) -> Void
    func update(_ object: T) -> Void
    func delete(_ object: T) -> Void
    func object(ofType type: AnyClass, forPrimaryKey key: String) -> T
}
