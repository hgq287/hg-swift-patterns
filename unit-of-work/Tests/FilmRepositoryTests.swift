//
//  FilmRepositoryTests.swift
//  UnitOfWorkTests
//
//  Created by Hg Q. on 7/11/19.
//

import XCTest
@testable import UnitOfWork

class FilmRepositoryTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        super.setUp()
        _ = MockFilmRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldSaveNewStudentWithoutWritingToDb() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let _BenHur: Film = Film(id: "0", title: "Ben-Hur (1959)", director: "William Wyler")
        let _Titanic = Film(id: "1", title: "Titanic (1997 film)", director: "epic romance and disaster film")
        let _TheLordOfTheRings = Film(id: "2", title: "The Lord of the Rings: The Return of the King", director: "epic fantasy adventure film co-produced")
        
        let mockFilmRepository: MockFilmRepository = MockFilmRepository()
 
        mockFilmRepository.repository.registerNew(object: _BenHur)
        mockFilmRepository.repository.registerNew(object: _TheLordOfTheRings)
        mockFilmRepository.repository.registerModified(object: _Titanic)
        mockFilmRepository.repository.registerModified(object: _BenHur)
        mockFilmRepository.repository.registerDeleted(object: _TheLordOfTheRings)

        XCTAssertEqual(2, mockFilmRepository.repository.context[.insert]?.count)
        XCTAssertEqual(2, mockFilmRepository.repository.context[.modify]?.count)
        XCTAssertEqual(1, mockFilmRepository.repository.context[.delete]?.count)
    }

    func testShouldSaveAllLocalChangesToDb() {
        let _BenHur: Film = Film(id: "0", title: "Ben-Hur (1959)", director: "William Wyler")
        let _Titanic = Film(id: "1", title: "Titanic (1997 film)", director: "epic romance and disaster film")
        let _TheLordOfTheRings = Film(id: "2", title: "The Lord of the Rings: The Return of the King", director: "epic fantasy adventure film co-produced")
        
        let mockFilmRepository: MockFilmRepository = MockFilmRepository()

        mockFilmRepository.repository.registerNew(object: _BenHur)
        mockFilmRepository.repository.registerModified(object: _TheLordOfTheRings)
        mockFilmRepository.repository.registerDeleted(object: _Titanic)
        mockFilmRepository.repository.commit()
        
        XCTAssertEqual(1, mockFilmRepository.repository.context[.insert]?.count)
        XCTAssertEqual(1, mockFilmRepository.repository.context[.modify]?.count)
        XCTAssertEqual(1, mockFilmRepository.repository.context[.delete]?.count)
    }

}
