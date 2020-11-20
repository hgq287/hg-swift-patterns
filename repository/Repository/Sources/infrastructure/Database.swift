//
//  Database.swift
//  Repository
//
//  Created by Hung Q. Truong on 7/21/19.
//

import Foundation
import Realm
import RealmSwift

open class Database: IDatabase {

    typealias T = Object
    
    
    let databasePath: String
    let realm: Realm
    
    public init(databasePath: String) {
        self.databasePath = databasePath
        self.realm = Realm.getRealm()
    }
    
    // MARK: - IDatabase Implementations
    public func add(_ object: Object) -> Void {
        try! realm.write {
            realm.add(object)
        }
    }
    
    public func update(_ object: Object) -> Void {}
    
    public func delete(_ object: Object) -> Void {
        try! realm.write {
            realm.delete(object)
        }
    }
    
}

extension Realm {
    static func getRealm() -> Realm {
        do {
            let fileURL = Configuration.defaultConfiguration.fileURL?
                .deletingLastPathComponent()
                .appendingPathComponent("swift-patterns.realm")
            
            let config = Configuration(
                fileURL: fileURL,
                encryptionKey: nil,
                schemaVersion: 1,
                migrationBlock: { migration, oldSchemaVersion in
                    print("schemaVersion");
            })
            
            do {
                return try Realm(configuration: config)
                
            } catch {
                print("Failed to open realm with error: \(error)")
                
                #if !DEBUG
                // Only delete realm file in production.
                // I often make mistake writing migration block, and don't want to lose my data.
                let fm = FileManager.default
                if let fileURL = fileURL, fm.fileExists(atPath: fileURL.path) {
                    try fm.removeItem(at: fileURL)
                }
                #endif
                
                return try Realm(configuration: config)
            }
            
        } catch {
            fatalError("\(error)")
        }
    }
}
