//
//  AbstractDocument.swift
//  AbstractDocument
//
//  Created by Hg Q. on 27/12/25.
//

import Foundation

public protocol IAbstractDocument {
    var properties: [String: Any] { get set }
    mutating func put(_ key: String, value: Any)
    func get(_ key: String) -> Any?
    func children<T>(_ key: String, constructor: ( [String: Any] ) -> T) -> [T]
}

open class AbstractDocument: IAbstractDocument {
    public var properties: [String : Any]
    
    public init(properties: [String : Any]) {
        self.properties = properties
    }
    
    public func put(_ key: String, value: Any) {
        properties[key] = value
    }
    
    public func get(_ key: String) -> Any? {
        return properties[key]
    }
    
    public func children<T>(_ key: String, constructor: ( [String: Any] ) -> T) -> [T] {
        guard let childrenData = properties[key] as? [[String: Any]] else {
            return []
        }
        
        return childrenData.map(constructor)
    }
}
