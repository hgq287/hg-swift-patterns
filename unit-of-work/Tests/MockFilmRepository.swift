//
//  MockFilmRepository.swift
//  UnitOfWorkTests
//
//  Created by Hg Q. on 7/11/19.
//

import Foundation
import UnitOfWork

public class MockFilmRepository {
    
    private let database: FilmDatabase
    public var repository: FilmRepository
    
    public init() {
        self.database = FilmDatabase()
        self.repository = FilmRepository(filmDatabase: database)
    }
}
