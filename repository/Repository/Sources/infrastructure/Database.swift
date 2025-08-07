//
//  Database.swift
//  Repository
//
//  Created by Hg Q. on 7/21/19.
//

import Foundation
import Realm
import RealmSwift

open class Database: IDatabase {

    public typealias T = Object
    
    
    let databasePath: String
    let realm: Realm
    
    public init(databasePath: String) {
        self.databasePath = databasePath
        if self.databasePath.isEmpty {
            self.realm = Realm.getRealm(fileURL: nil)
        } else {
            let fileURL: URL = URL.init(fileURLWithPath: self.databasePath)
            self.realm = Realm.getRealm(fileURL: fileURL)
        }
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
    
    public func object(ofType type: AnyClass, forPrimaryKey key: String) -> Object? {
        let object = try! realm.object(ofType: type as! Object.Type, forPrimaryKey: key)
        return object
    }
}

extension Realm {
    static func getRealm(fileURL: URL?) -> Realm {
        do {
            let fileURL = (fileURL != nil) ? fileURL : Configuration.defaultConfiguration.fileURL?
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
