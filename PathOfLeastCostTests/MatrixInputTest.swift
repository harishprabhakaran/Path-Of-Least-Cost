//
//  MatrixInputTest.swift
//  PathOfLeastCostTests
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import XCTest
@testable import PathOfLeastCost

/// Matrix Input Test Cases - Class to test all the possible positive input scenarios.
class MatrixInputTest: XCTestCase {

    let sampleMatrix1 = "19 10 19 10 19\n21 23 20 19 12\n20 12 20 11 10"
    let sampleMatrix2 = "1 2 3\n4 5 6\n7 8 9"
    let sampleMatrix3 = "5\n8\n3\n5"
    let sampleMatrix4 = "5 8 3 5"
    let sampleMatrix5 = "5"
    
    var inputValidator: MatrixValidator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        inputValidator = MatrixValidator()
    }
    
    //MARK:- Test Matrix Validation1
    func testMatrixValidation1() {
        let output = inputValidator.validateMatrix(with: sampleMatrix1)
        XCTAssertTrue(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.NoErrorMessage.rawValue)
    }
    
    //MARK:- Test Matrix Validation2
    func testMatrixValidation2() {
        let output = inputValidator.validateMatrix(with: sampleMatrix2)
        XCTAssertTrue(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.NoErrorMessage.rawValue)
    }
    
    //MARK:- Test Matrix Validation3
    func testMatrixValidation3() {
        let output = inputValidator.validateMatrix(with: sampleMatrix3)
        XCTAssertTrue(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.NoErrorMessage.rawValue)
    }
    
    //MARK:- Test Matrix Validation4
    func testMatrixValidation4() {
        let output = inputValidator.validateMatrix(with: sampleMatrix4)
        XCTAssertTrue(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.NoErrorMessage.rawValue)
    }
    
    //MARK:- Test Matrix Validation5
    func testMatrixValidation5() {
        let output = inputValidator.validateMatrix(with: sampleMatrix5)
        XCTAssertTrue(output.matrix.count > 0)
        XCTAssertEqual(output.errorMessage.rawValue, ErrorMessage.NoErrorMessage.rawValue)
    }
}
