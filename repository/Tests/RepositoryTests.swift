//
//  RepositoryTests.swift
//  RepositoryTests
//
//  Created by Hg Q. on 7/15/19.
//

import XCTest
@testable import Repository

class RepositoryTests: XCTestCase {
    
    var database: Database!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let testBundle = Bundle(for: type(of: self))
        let infoDict: [String: Any]? = testBundle.infoDictionary
        let bundleIdentifier: String = testBundle.bundleIdentifier! as String
        let dbName = infoDict?["DB_NAME"] as? String
        let fileManager = FileManager.default
        let appSupportURL: URL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let stringURL: String = appSupportURL.path
        let appDataDirectory = stringURL + "/" +  bundleIdentifier
        try fileManager.removeItem(at: URL.init(fileURLWithPath: appDataDirectory))
        try fileManager.createDirectory(at: URL.init(fileURLWithPath: appDataDirectory), withIntermediateDirectories: true, attributes: nil)
        let dbPath = stringURL + "/" +  bundleIdentifier + "/" + dbName! + ".realm"
       
        self.database = Database(databasePath: dbPath)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreate() throws {
        let repo: FilmRepository = FilmRepository(self.database)
        let _Titanic = Film(id: "0", title: "Titanic (1997 film)", director: "epic romance and disaster film", pos: 0.0)
        let _TheLordOfTheRings = Film(id: "1", title: "The Lord of the Rings: The Return of the King", director: "epic fantasy adventure film co-produced", pos: 0.0)
        let _BenHur: Film = Film(id: "2", title: "Ben-Hur (1959)", director: "William Wyler", pos: 0.0)
        repo.add(_Titanic)
        repo.add(_TheLordOfTheRings)
        repo.add(_BenHur)
        
        let titanic: Film = repo.object(forPrimaryKey: "0")
        let theLordOfTheRings: Film = repo.object(forPrimaryKey: "1")
        let benHur: Film = repo.object(forPrimaryKey: "2")
        XCTAssertEqual(titanic.id, "0")
        XCTAssertEqual(theLordOfTheRings.id, "1")
        XCTAssertEqual(benHur.id, "2")
    }
}
