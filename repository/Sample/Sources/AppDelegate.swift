//
//  AppDelegate.swift
//  Sample
//
//  Created by Hg Q. on 7/10/19.
//  Copyright © 2020 Hg Q. All rights reserved.
//

import Cocoa
import Repository

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let infoDict: [String: Any]? = Bundle.main.infoDictionary
        let bundleIdentifier: String = Bundle.main.bundleIdentifier! as String
        let dbName = infoDict?["DB_NAME"] as? String
         let fileManager = FileManager.default
        let appSupportURL: URL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let stringURL: String = appSupportURL.path
        let dbPath = stringURL + "/" +  bundleIdentifier + "/" + dbName! + ".realm"
        
        let database: Database = Database(databasePath: dbPath)

        
        let _filmRepository = FilmRepository(database)

        let _Titanic = Film(id: "0", title: "Titanic (1997 film)", director: "epic romance and disaster film", pos: 0.0)
        let _TheLordOfTheRings = Film(id: "1", title: "The Lord of the Rings: The Return of the King", director: "epic fantasy adventure film co-produced", pos: 0.0)
        let _BenHur: Film = Film(id: "2", title: "Ben-Hur (1959)", director: "William Wyler", pos: 0.0)
        _filmRepository.add(_Titanic)
        _filmRepository.add(_TheLordOfTheRings)
        _filmRepository.add(_BenHur)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

