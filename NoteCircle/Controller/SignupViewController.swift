//
//  SignupViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 09/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    
    var validationModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func submitTapped(_ sender: Any) {
        validationModel.submitTapped(vc: self)
        print("SUCESS")
    }
    
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        switch textField {
        case firstNameTextField:
            self.validationModel.firstName = text ?? ""
        case lastNameTextField:
            self.validationModel.lastName = text ?? ""
        case dateOfBirthTextField:
            self.validationModel.dateOfBirth = text ?? ""
        case phoneNumberTextField:
            self.validationModel.phoneNumber = text ?? ""
        case genderTextField:
            self.validationModel.gender = text ?? ""
        case emailIdTextField:
            self.validationModel.emailId = text ?? ""
        case passwordTextField:
            self.validationModel.password = text ?? ""
        case conformPasswordTextField:
            self.validationModel.confirmPassword = text ?? ""
        default: break
        }
    }
}
