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
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        print("submit button tapped")
        guard let email = emailIdTextField.text, let password = passwordTextField.text,
            let phone = phoneNumberTextField.text else {
                return
        }
        let isValidateEmail = isValidEmail(email: email)
        if (isValidateEmail == false) {
            displayAlertMessage(messageToDisplay: "Incorrect Email")
            print("Incorrect Email")
            return
        }
        let isValidatePass = isValidPassword(password: password)
        if (isValidatePass == false) {
            displayAlertMessage(messageToDisplay: "Incorrect password")
            print("Incorrect password")
            return
        }
        let isValidatePhone = isValidPhone(phone: phone)
        if (isValidatePhone == false) {
            displayAlertMessage(messageToDisplay: "Incorrect PhoneNumber")
            print("Incorrect Phone")
            return
        }
        if (isValidateEmail == true || isValidatePass == true || isValidatePhone == true) {
            login(info: "All Field are valid")
            print("All fields are valid")
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
    func isValidPassword(password : String) -> Bool{
        
        let pwReEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let pwStringTrmin = password.trimmingCharacters(in: .whitespaces)
        let validatePw = NSPredicate(format: "SELF MATCHES %@", pwReEx)
        let isValidatePw = validatePw.evaluate(with: pwStringTrmin)
        return isValidatePw
    }
    func login(info: String) {
        let alert = UIAlertController(title: "NoteCircle", message: "Sucessfully logged in with \(info)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
// MARK: - TextFieldDelegate
//extension LoginViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == phoneNumberTextField {
//            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
//            let characterSet = CharacterSet(charactersIn: string)
//            return allowedCharacters.isSuperset(of: characterSet)
//        }
//        return true
//    }}
