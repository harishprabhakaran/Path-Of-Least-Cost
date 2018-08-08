//
//  LeastCostCalc.swift
//  PathOfLeastCost
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation

class LeastCostCalculator {
    
    //MARK:-  To find the least cost using the given matrix
    ///
    /// - Parameter inputMatrix: Array which contains array of Int elements
    /// - Returns: Tuple of Cost, Path and Valid status
    func findLeastCost(inputMatrix: [[Int]]) -> (cost: Int, path: [Int], valid: Bool) {
        var matrix = inputMatrix
        var leastCost = 0
        var leastRow = 0
        var leastCol = 0
        var isValid = true
        var tempCost = 0
        var pathArray = [Int]()
        let maximumCost = 50
        
        // To calculate the minimum cost in the given matrix
        for col in 0..<matrix[0].count {
            for row in 0..<matrix.count {
                if(col == 0) {
                    matrix[row][col] = matrix[row][col]
                } else {
                    matrix[row][col] = matrix[row][col] + getMinimumValue(row: row, col: col, matrix: matrix).minimumValue
                }
                if(col == matrix[0].count - 1){
                    if row == 0 || matrix[row][col] < leastCost {
                        leastRow = row
                        leastCol = col
                    }
                    if row == 0 || matrix[row][col] < leastCost {
                        leastCost = matrix[row][col]
                    }
                }
            }
        }
        
        //If the node value is greater then 50, no need to add the node in path list.
        if leastCost < maximumCost {
            pathArray.append(leastRow+1)
        } else {
            isValid = false
        }
        
        // To calculate the minimim path for the calculated least cost
        for _ in matrix[0].enumerated() {
            if(leastCol > 0) {
                //Get the min value of diagonal top, bottom and adjacent right nodes/
                let node = getMinimumValue(row: leastRow, col: leastCol, matrix: matrix)
                leastRow = node.minRow
                leastCol = node.minCol
                
                //If the node value is greater then 50, no need to add the node in path list.
                if node.minimumValue < maximumCost {
                    leastCost = tempCost == 0 && !isValid ? node.minimumValue : leastCost
                    tempCost = leastCost
                    pathArray.append(node.minRow+1)
                } else {
                    isValid = false
                }
            }
        }
        
        //Reverse the array to get the path
        let leastPath = pathArray.reversed().map{$0}
        
        //If the path is empty then the least count should be ZER)
        leastCost = pathArray.count > 0 ? leastCost : 0
        
        //Return values in the tuple format
        //Cost
        //Path
        //isValid
        return (cost: leastCost, path: leastPath, valid: isValid)
    }
    
    //MARK:- To get the minimum value between numbers
    ///
    /// - Parameter row: row in the matrix
    /// - Parameter column: column in the matrix
    /// - Parameter matrix: provided matrix
    /// - Returns: Tuple of minimum row, minimum column and minimum value
    func getMinimumValue(row: Int, col: Int, matrix: [[Int]]) -> (minRow: Int, minCol: Int, minimumValue: Int) {
        let lastRow = matrix.count - 1
        let firstRow = 0
        var leftDiagonalDown = row + 1
        var leftDiagonalUp = row - 1
        
        //If row is FIRST ROW (0) then take last row as ADJACENT
        if row == firstRow {
            leftDiagonalUp = lastRow
        }
        
        //If row is LAST ROW then take first row as ADJACENT
        if row == lastRow {
            leftDiagonalDown = firstRow
        }
        
        // To get the min value between 3 numbers.
        let downValue = matrix[leftDiagonalDown][col-1]
        let rightValue = matrix[row][col-1]
        let upValue = matrix[leftDiagonalUp][col-1]
        
        var minValue = downValue
        var mRow = leftDiagonalDown
        let mCol = col-1
        
        //Minimum value calculation
        if minValue > upValue {
            minValue = upValue
            mRow = leftDiagonalUp
        }
        if minValue > rightValue {
            minValue = rightValue
            mRow = row
        }
        
        return(minRow: mRow, minCol: mCol, minimumValue: minValue)
    }
    
}
