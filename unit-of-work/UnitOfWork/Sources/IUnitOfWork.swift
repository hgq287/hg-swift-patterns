//
//  IUnitOfWork.swift
//  UnitOfWork
//
//  Created by Hg Q. on 7/11/19.
//

import Foundation

protocol IUnitOfWork {
    
    associatedtype T
    
    func registerNew(object: T)
    func registerModified(object: T)
    func registerDeleted(object: T)
    func commit()
}
