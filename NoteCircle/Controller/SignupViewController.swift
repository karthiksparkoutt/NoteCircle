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
    @IBAction func submitTapped(_ sender: UIButton) {
          validationModel.submitTapped(vc: self)
     }
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        switch textField {
        case firstNameTextField:
            self.validationModel.userName = text ?? ""
        case lastNameTextField:
            self.validationModel.userName = text ?? ""
            case dateOfBirthTextField:
                self.validationModel.userName = text ?? ""
            case phoneNumberTextField:
                self.validationModel.userName = text ?? ""
            case genderTextField:
                self.validationModel.userName = text ?? ""
        case emailIdTextField:
            self.validationModel.email = text ?? ""
        case passwordTextField:
            self.validationModel.password = text ?? ""
        case conformPasswordTextField:
            self.validationModel.confirmPassword = text ?? ""
        default: break
        }
    }
}
