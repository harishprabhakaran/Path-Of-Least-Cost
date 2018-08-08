//
//  StringTest.swift
//  PathOfLeastCostTests
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import XCTest
@testable import PathOfLeastCost

/// String Extensio Test - To test the extension methods in String Class
class StringExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//MARK: - Pass Test Cases
    
    /// Test case -> strings contains non-numeric characters
    func testContainsNonNumericInput() {
        let output = "1 2 3 a".containsNonNumeric
        XCTAssertTrue(output, "Contains Non-Numeric Characters")
    }
    
    /// Test case -> Test if the matrix is valid
    func testIsValidMatrix() {
        let output = "6 7 8".formMatrix()
        XCTAssertTrue(output.matrix.count > 0, "Is valid matrix")
    }
    
// MARK: - Fail Test Cases
    
    /// Test case -> strings doesn't contains non-numeric characters
    func testNumericInput() {
        let output = "1 2 3".containsNonNumeric
        XCTAssertFalse(output, "No Non-Numeric Characters")
    }
    
    /// Test case -> Test if the matrix is valid
    func testInValidMatrix() {
        let output = " ".formMatrix()
        XCTAssertFalse(output.matrix.count > 0, "In valid matrix")
    }
}
