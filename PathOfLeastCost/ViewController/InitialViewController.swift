//
//  ViewController.swift
//  PathOfLeastCost
//
//  Created by Harish Prabhakaran on 8/7/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var inputTextBox: UITextView!
    
    @IBOutlet weak var inputScrollContainer: UIScrollView!
    
    @IBOutlet weak var outputTitle: UILabel!
    @IBOutlet weak var hasTravelledLabel: UILabel!
    @IBOutlet weak var pathLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var pathTextField: UITextField!
    
    @IBOutlet weak var pathTextView: UITextView!
    var POLCMATRIX: [[Int]]?
    var costCalculator: LeastCostCalculator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
    }
    
    // Make the status bar color to white.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK:- To make the initial UI works
    func initializeUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(InitialViewController.singleTap(sender:)))
        inputScrollContainer.addGestureRecognizer(tapGesture)
        
        //add border color, corner radius to views
        inputScrollContainer.addLightGrayBorder()
        resultView.addLightGrayBorder()
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        inputTextBox.becomeFirstResponder()
    }
    
    // MARK:- To calculate the lease cost, path with the given matrix
    func calculateLeastCost() {
        costCalculator = LeastCostCalculator()
        let polc = costCalculator?.findLeastCost(inputMatrix: POLCMATRIX!)
        
        //Display the Cost, Path, Valid in Output box
        if let costValue = polc?.cost, let pathValue = polc?.path {
            let isValid = (polc?.valid)! ? "YES" : "NO"
            let cost = "\(costValue)"
            let path = "\(pathValue)"
            
            self.resultView.isHidden = false
            self.costLabel.text = cost
            self.pathLabel.text = path
            self.pathTextView.text = path
            self.pathTextField.text = path
            self.hasTravelledLabel.text = isValid
        }
    }
    
    // MARK:- To dismiss the keyboard when user taps on view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//MARK: - IBAction Methods
extension InitialViewController {
    
    /// To perform the calculation of least path
    ///
    /// - Parameter sender: button sender
    @IBAction func calculateLeastPath(_ sender: Any) {
        
        //Validate the user input string
        let validator = MatrixValidator()
        let matrixValue = validator.validateMatrix(with: self.inputTextBox.text)
        
        self.outputTitle.isHidden = false
        //Show error if the matrix value is invalid
        if matrixValue.matrix.count > 0 {
            self.errorLabel.isHidden = true
            self.POLCMATRIX = matrixValue.matrix
            self.calculateLeastCost()
        } else {
            self.resultView.isHidden = true
            self.errorLabel.isHidden = false
            self.errorLabel.text = matrixValue.errorMessage.rawValue
        }
    }
    
    /// To clear the text entered in textview
    ///
    /// - Parameter sender: button sender
    @IBAction func clearTextAction(_ sender: Any) {
        self.inputTextBox.text = ""
        self.inputTextBox.resignFirstResponder()
        self.resultView.isHidden = true
        self.errorLabel.isHidden = true
        self.outputTitle.isHidden = true
    }
}
