//
//  String+Extension.swift
//  PathOfLeastCost
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation


extension String {
    
    typealias MatrixOutput = (matrix: [[Int]], errorMessage: ErrorMessage)
    
    /// To check if the string contains any character other than numeric and whitespace and newlines
    /// - Returns: true or false based on condition
    var containsNonNumeric: Bool {
        let acceptedCharacters = "0123456789-1-2-3-4-5-6-7-8-9\n "
        let filterCharacters = self.filter{ return !acceptedCharacters.contains($0) }
        return filterCharacters.count > 0
    }
    
    /// Forms matrix for the give string
    /// - Returns: Array which contains array of Int elements
    func formMatrix() -> MatrixOutput {
        var inputMatrix = [[Int]]()
        var rowCount = 0
        
        guard self.count > 0 else { return (matrix: inputMatrix, errorMessage: .EmptyErrorMessage) }
        
        //Check if the string has any non-numeric characters.
        guard !containsNonNumeric else {
            return (matrix: inputMatrix, errorMessage: .NumericErrorMessage)
        }
        
        //Seperate string by \n to get the rows.
        var rows = self.components(separatedBy: "\n")
        
        //Filter all empty rows
        rows = rows.filter { !($0.isEmpty) }
        
        //Remove all whitespaces in rows
        let trimmed = rows.map { $0.trimmingCharacters(in: .whitespaces) }
        
        for row in trimmed {
            let temRow = row.components(separatedBy: " ")
            rowCount = rowCount == 0 ? temRow.count : rowCount
            
            //Check if all the rows are equal
            if rowCount == temRow.count {
                if !(row.isEmpty || row == " "){
                    var columnArray = [Int]()
                    let column = row.components(separatedBy: " ")
                    for col in column {
                        if !col.isEmpty, let colValue = Int(col){
                            columnArray.append(colValue)
                        }
                    }
                    inputMatrix.append(columnArray)
                }
            } else {
                inputMatrix.removeAll()
                return (matrix: inputMatrix, errorMessage: .RowMisMatchErrorMessage)
            }
        }
        
        return validateMinMaxRowColumn(matrix: inputMatrix) ? (matrix: inputMatrix, errorMessage: .NoErrorMessage) : (matrix: [], errorMessage: .MatrixSizeErrorMessage)
    }
    
    /// To validate the matrix to check the min and max number of rows and columns
    /// - Returns: true or false based on condition
    func validateMinMaxRowColumn(matrix: [[Int]]) -> Bool {
        
        guard matrix.count > 0 else {
            return false
        }
        
        var isValidMatrix = true
        let minCondition = matrix.count >= 1 && matrix[0].count >= 1
        let maxCondition = matrix.count <= 10 && matrix[0].count <= 100

        //Validation: Minimum of 1 row and 5 columns up to 10 rows and 100 columns
        if minCondition && maxCondition {
            isValidMatrix = true
        } else {
            isValidMatrix = false
        }
        
        return isValidMatrix
    }
}
