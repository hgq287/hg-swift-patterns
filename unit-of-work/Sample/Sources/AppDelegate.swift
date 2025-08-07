//
//  AppDelegate.swift
//  Sample
//
//  Created by Hg Q. on 7/10/19.
//  Copyright © 2019 Hg Q. All rights reserved.
//

import Cocoa
import UnitOfWork

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let _BenHur: Film = Film(id: "0", title: "Ben-Hur (1959)", director: "William Wyler")
        let _Titanic = Film(id: "1", title: "Titanic (1997 film)", director: "epic romance and disaster film")
        let _TheLordOfTheRings = Film(id: "2", title: "The Lord of the Rings: The Return of the King", director: "epic fantasy adventure film co-produced")

        let context: Dictionary<String, Array<Film>> = Dictionary<String, Array<Film>>()
        let database: FilmDatabase = FilmDatabase()
        
        let repository: FilmRepository = FilmRepository(context: context, filmDatabase: database)
        repository.registerNew(object: _BenHur)
        repository.registerModified(object: _Titanic)
        repository.registerModified(object: _BenHur)
        repository.registerNew(object: _TheLordOfTheRings)
        repository.registerDeleted(object: _TheLordOfTheRings)
        
        repository.commit()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

