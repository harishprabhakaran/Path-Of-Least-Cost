//
//  LeastCostCalculator.swift
//  PathOfLeastCost
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation

// MARK:- To calculate the lease cost, path with the given matrix with Recursive Method
class LeastCostCalculatorRecursive {
    
    var matrixArray = [[Int]]()
    var numberOfRows = 0
    var numberOfColumns = 0
    let maximumCost = 50
    var leastCostData = [POLC]()
    
    init() {
    }
    
    //MARK: - To find the least cost with the matrix
    ///
    /// - Parameter inputArray: array to be parsed
    /// - Returns: POLC object
    func findPathOfLeastCost(inputArray:[[Int]]) -> POLC {
        
        matrixArray = inputArray
        numberOfRows = matrixArray.count
        numberOfColumns = matrixArray[0].count

        /// Traverse all the rows and calculate the least cost, path
        for row in stride(from: 1, through: numberOfRows, by: 1) {
            let data = leastCostCalculation(row: row, column: 1, value: 0, path: [])
            leastCostData.append(data)
        }
        let leastPOLC = getleastPOLC(listOfData: leastCostData)
        return leastPOLC
    }
    
    //MARK: - Parsing the matrix with the diagonal up, horizontal right, diagonal down
    ///
    /// - Parameter row: row in the matrix
    /// - Parameter column: column in the matrix
    /// - Parameter value: value in the matrix(row,column)
    /// - Parameter path: path in which the traversal goes
    /// - Returns: POLC object
    fileprivate func leastCostCalculation(row: Int, column: Int, value: Int, path:[Int]) -> POLC {
        
        let leastCost = costCalculation(row: row, column: column, value: value)
        let leastPath = path + [row]
        
        /// If the cost is more than 50, then return
        if leastCost > maximumCost {
            return POLC(cost: value, path: path, hasPathTravelledAllWay: false)
        }
        else if column == numberOfColumns {
            return POLC(cost: leastCost, path: leastPath, hasPathTravelledAllWay: true)
        }
        
        /// Calculate Top, Bottom and Right nodes
        let topNode = adjacentTopCalculation(row: row, column: column)
        let rightNode = horizontalCalculation(row: row, column: column)
        let bottomNode = adjacentBottomCalculation(row: row, column: column)
        
        /// Call the leastCostCalculation with the next required nodes
        let diagonalTop = leastCostCalculation(row: topNode.row, column: topNode.column, value: leastCost, path: leastPath)
        let diagonalRight = leastCostCalculation(row: rightNode.row, column: rightNode.column, value: leastCost, path: leastPath)
        let diagonalBottom = leastCostCalculation(row: bottomNode.row, column: bottomNode.column, value: leastCost, path: leastPath)
        
        let minCost = findMinimumCost(top: diagonalTop, bottom: diagonalBottom, horizontal: diagonalRight)
        return minCost
        
    }
    
    //MARK: - Calculating the previous path value with the current value
    ///
    /// - Parameter row: row in the matrix
    /// - Parameter column: column in the matrix
    /// - Parameter value: value in the matrix(row,column)
    /// - Returns: new cost
    fileprivate func costCalculation(row: Int, column: Int, value: Int) -> Int{
        if !(row <= 0 || column <= 0 || row > numberOfRows || column > numberOfColumns) {
            return matrixArray[row - 1][column - 1] + value
        }
        return 0
    }
    
    //MARK: - Travering to the diagonal top of the matrix
    ///
    /// - Parameter row: row in the matrix
    /// - Parameter column: column in the matrix
    /// - Returns: new path to traverse
    fileprivate func adjacentTopCalculation(row: Int, column: Int) -> (row: Int, column: Int) {
        if !(column >= numberOfColumns) {
            return (row == 1 ? numberOfRows : row - 1, column + 1)
        }
        return (0,0)
    }
    
    //MARK: - Travering to the diagonal bottom of the matrix
    ///
    /// - Parameter row: row in the matrix
    /// - Parameter column: column in the matrix
    /// - Returns: new path to traverse
    fileprivate func adjacentBottomCalculation(row: Int, column: Int) -> (row: Int, column: Int) {
        if !(column >= numberOfColumns) {
            return (row == numberOfRows ? 1 : row + 1, column + 1)
        }
        return (0,0)
    }
    
    //MARK: - Travering to the adjacent right of the matrix
    ///
    /// - Parameter row: row in the matrix
    /// - Parameter column: column in the matrix
    /// - Returns: new path to traverse
    fileprivate func horizontalCalculation(row: Int, column: Int) -> (row: Int, column: Int) {
        if !(column >= numberOfColumns) {
            return (row, column + 1)
        }
        return (0,0)
    }
    
    //MARK: - To find the minimum cost with the three values
    ///
    /// - Parameter top: Diagonal top POLC object
    /// - Parameter bottom: Diagonal bottom POLC object
    /// - Parameter horizontal: Adjacent right POLC object
    /// - Returns: minimum cost of POLC object
    fileprivate func findMinimumCost(top: POLC, bottom: POLC, horizontal: POLC) -> POLC {
        let data = [top, bottom, horizontal]
        let minCost = data.sorted(by: { $0.cost! < $1.cost! })
        return minCost.first!
    }
    
    //MARK: - To find the least cost and path
    ///
    /// - Parameter listOfData: Array of POLC objects
    /// - Returns: POLC object
    fileprivate func getleastPOLC(listOfData: [POLC]) -> POLC {
        let leastPOLC = listOfData.sorted(by: { $0.cost! < $1.cost! })
        return leastPOLC.first!
    }
}
