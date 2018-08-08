//
//  ErrorMessageTest.swift
//  PathOfLeastCostTests
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import XCTest
@testable import PathOfLeastCost

/// Error Message Test Case - Class for testing all the error messages for the given input.
class ErrorMessageTest: XCTestCase {
    
    var inputValidator: MatrixValidator!
    
    override func setUp() {
        super.setUp()
        inputValidator = MatrixValidator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK:- Test case1 - Please enter Matrix Value
    func testEmptyErrorMessage() {
        let output = inputValidator.validateMatrix(with: "")
        XCTAssertFalse(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.EmptyErrorMessage.rawValue)
    }
    
    //MARK:- Test case2 - Please enter only numeric values
    func testNumericErrorMessage() {
        let output = inputValidator.validateMatrix(with: "A B C")
        XCTAssertFalse(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.NumericErrorMessage.rawValue)
    }
    
    //MARK:- Test case3 - Please enter equal number of rows in matrix
    func testRowMisMatchErrorMessage() {
        let output = inputValidator.validateMatrix(with:
            "19 29 29\n 20 21 22\n 22 23"
        )
        XCTAssertFalse(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.RowMisMatchErrorMessage.rawValue)
    }
    
    //MARK:- Test case4 - Please enter minimum of 1 row and 1 columns up to 10 rows and 100 columns
    func testNonEqualRowErrorMessage() {
        let output = inputValidator.validateMatrix(with: "1\n2\n3\n4\n5\n6\n7\n8\n9\n0\n1")
        XCTAssertFalse(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.MatrixSizeErrorMessage.rawValue)
    }
}
