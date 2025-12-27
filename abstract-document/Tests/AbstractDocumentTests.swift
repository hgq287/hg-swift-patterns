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
}
