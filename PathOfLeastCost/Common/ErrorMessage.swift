//
//  ErrorMessage.swift
//  PathOfLeastCost
//
//  Created by Harish Prabhakaran on 8/8/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation

// MARK:- Error messages for the input
public enum ErrorMessage: String {
    case EmptyErrorMessage = "Please enter Matrix Value"
    case NumericErrorMessage = "Please enter only numeric values"
    case RowMisMatchErrorMessage = "Please enter equal number of rows in matrix"
    case MatrixSizeErrorMessage = "Please enter minimum of 1 row and 1 columns up to 10 rows and 100 columns"
    case NoErrorMessage = ""
}
