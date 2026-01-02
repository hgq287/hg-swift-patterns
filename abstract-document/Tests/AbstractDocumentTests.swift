//
//  AbstractDocumentTests.swift
//  AbstractDocumentTests
//
//  Created by Hg Q. on 27/12/25.
//

import XCTest
@testable import AbstractDocument

final class AbstractDocumentTests: XCTestCase {
    func testPutAndGet() {
        let doc = AbstractDocument(properties: [:])
        doc.put("name", value: "Abstract Document design pattern")
        XCTAssertEqual(
            doc.get("name") as! String,
            "Abstract Document design pattern"
        )
    }
    
    func testChildrenMapping() {
        let data: [String: Any] = [
            "patterns": [
                ["name": "Abstract Document", "type": "Structural"],
                ["name": "Factory Method", "type": "Creational"]
            ]
        ]
        let doc = AbstractDocument(properties: data)
        let children = doc.children("patterns") { dict in
            return dict["name"] as! String
        }
        
        XCTAssertEqual(children.count, 2)
        XCTAssertEqual(children.first, "Abstract Document")
    }
}
