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
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View Methods
    fileprivate func setupView() {
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let providedEmailAddress = emailIdTextField.text

        
        let isEmailAddressValid = isValidEmail(email: providedEmailAddress!)

        if isEmailAddressValid
        {
            print("is valid")
        } else {
            print("is not valid")
            displayAlertMessage(messageToDisplay: " is not valid")
        }
        

    }
    
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }

    func isValidEmail(email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "NoteCircle", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
