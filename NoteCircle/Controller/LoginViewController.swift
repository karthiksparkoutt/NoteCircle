//
//  SignupViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 09/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var passwordValidationLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.textDidChange(_:)),
            name: UITextField.textDidChangeNotification,
            object: nil)
    }
    
    // MARK: - View Methods
    fileprivate func setupView() {
        saveButton.isEnabled = false
        passwordValidationLabel.isHidden = true
    }
    
    // MARK: - Notification Handling
    @objc private func textDidChange(_ notification: Notification) {
        var formIsValid = true
        for textField in textFields {
            let (valid, _) = validate(textField)
            guard valid else {
                formIsValid = false
                break
            }
        }
        saveButton.isEnabled = formIsValid
    }
    
    // MARK: - Helper Methods
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return (false, nil)
        }
        
        if textField == passwordTextField {
            return (text.count >= 6, "Your password is too short.")
        }
        
        return (text.count > 0, "This field cannot be empty.")
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            let (valid, message) = validate(textField)
            
            if valid {
                emailIdTextField.becomeFirstResponder()
            }
            
            self.passwordValidationLabel.text = message
            
            UIView.animate(withDuration: 0.25, animations: {
                self.passwordValidationLabel.isHidden = valid
            })
        default:
            emailIdTextField.resignFirstResponder()
        }
        
        return true
    }
}
