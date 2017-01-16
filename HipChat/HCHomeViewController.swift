//
//  ViewController.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import UIKit

class HCHomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    
    let messageProcessor = HCChatProcessor()
    var messageText: String!
    var resultText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initialize view
        self.initializeButtons()
        self.resetValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TextField Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.messageText = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignResponder()
        return true
    }
    
    // MARK: Event Handlers
    @IBAction func submitButtonAction(_ sender: Any) {
        
        self.resignResponder()
        
        if !self.messageText.isEmpty {
            
            let concurrentQueue = DispatchQueue(label: "chat_homescreen_queue", attributes: .concurrent)
            
            EZLoadingActivity.show("Loading...", disableUI: true)
            
            concurrentQueue.async {
                
                self.resultText = self.messageProcessor.jsonFromText(pText: self.messageText)
                
                DispatchQueue.main.async {
                    
                    if self.resultText.isEmpty {
                        EZLoadingActivity.hide(false, animated: true)
                        self.resetValues()
                    }
                    else {
                        EZLoadingActivity.hide(true, animated: true)
                        self.resultTextView.text = self.resultText ?? self.resultText
                    }
                }
            }
        }
        else {
            
            HCUITheme.shakeTextField(textField: self.messageTextField)
            
//            HCUtils.displayAlert(title: Constants.Labels.ErrorAlertTitle,
//                                 message: Constants.Labels.RequiredFieldError,
//                                 buttonTitle: Constants.Labels.ErrorButtonTitle, controller: self)
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        self.resetValues()
    }
    
    // MARK: Helper Methods
    func initializeButtons() {
        
        var submitBtn = submitButton!
        var resetBtn = resetButton!
        
        HCUITheme.configureRoundedButton(button: &submitBtn)
        HCUITheme.configureRoundedButton(button: &resetBtn)
    }
    
    func resetValues() {
        self.messageText = ""
        self.resultText = ""
        self.messageTextField.text = ""
        self.resultTextView.text = ""
    }
    
    func resignResponder() {
        self.messageTextField.resignFirstResponder()
    }
    
    
}

