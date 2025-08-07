//
//  FilmRepository.swift
//  UnitOfWork
//
//  Created by Hg Q. on 7/11/19.
//

import Foundation

public class FilmRepository: IUnitOfWork {
    
    public typealias T = Film
    
    public enum Operation: String {
        case insert = "INSERT"
        case modify = "MODIFY"
        case delete = "DELETE"
    }
    
    fileprivate let filmDatabase: FilmDatabase

    public var context: [Operation: [Film]] = [:]
    
    public init(filmDatabase: FilmDatabase) {
        self.filmDatabase = filmDatabase
    }
    
    // MARK: - Public Methods
    
    public func registerNew(object: Film) {
        print("Registering \(object.title) for insert in context")
        self.register(object: object, operation: .insert)
    }
    
    public func registerModified(object: Film) {
        print("Registering \(object.title) for modify in context")
        self.register(object: object, operation: .modify)
    }
    
    public func registerDeleted(object: Film) {
        print("Registering \(object.title) for delete in context")
        self.register(object: object, operation: .delete)
    }
    
    public func commit() {
        guard !context.isEmpty else {
            print("No changes to commit.")
            return
        }
        
        self.commitInsert()
        self.commitModify()
        self.commitDelete()
        
        // Clear the context after a successful commit
        self.context.removeAll()
        print("Commit successful. Context cleared.")
    }
    
    // MARK: - Internal Methods
    
    private func register(object: Film, operation: Operation) {
        self.context[operation, default: []].append(object)
    }
    
    private func commitInsert() {
        if let filmsToBeInserted = self.context[.insert] {
            for film in filmsToBeInserted {
                print("Saving \(film.title) to database")
                self.filmDatabase.insert(film: film)
            }
        }
    }
    
    private func commitModify() {
        if let filmsToBeModified = self.context[.modify] {
            for film in filmsToBeModified {
                print("Modifying \(film.title) to database")
                self.filmDatabase.modify(film: film)
            }
        }
    }
    
    private func commitDelete() {
        if let filmsToBeDeleted = self.context[.delete] {
            for film in filmsToBeDeleted {
                print("Deleting \(film.title) from database")
                self.filmDatabase.delete(film: film)
            }
        }
    }
}
