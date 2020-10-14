//
//  SignupViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 09/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    
    //MARK: - Class Properties
    var validation = TextFieldValidation()
    
    //MARK: - UIViewController Events
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func registerBtnAction(_ sender: Any) {
        guard let name = firstNameTextField.text, let email = emailIdTextField.text?.trimmingCharacters(in: .whitespaces), let phone = phoneNumberTextField.text?.trimmingCharacters(in: .whitespaces), let pw = passwordTextField.text?.trimmingCharacters(in: .whitespaces) else{return}
        
        
        let isNameValidate = self.validation.nameValidation(name)
        
        if isNameValidate == false{
            
            alertDialouge(title: "Error!!", msg: "Invalid Name String!")
            return
        }
        let isEmailValidate = self.validation.emailValidation(email)
        
        if isEmailValidate == false{
            alertDialouge(title: "Error!!", msg: "Invalid Email String!")
            return
            
        }
        let isPhoneValidate = self.validation.phoneNumberValidation(phone)
        
        if isPhoneValidate == false{
            
            alertDialouge(title: "Error!!", msg: "Invalid Phone Number!")
            return
        }
        let isPwValidate = self.validation.passwordValidation(pw)
        if(passwordTextField.text == "" || conformPasswordTextField.text == "") {}
        
        if isPwValidate == false{
            alertDialouge(title: "Error", msg: "Invalid Password!")
            return
        }
        
        if (isNameValidate == true && isEmailValidate == true && isPhoneValidate == true && isPwValidate == true){
            alertDialouge(title: "Alert!!", msg: "Success!")
        }
        
    }
    
}


extension LoginViewController {
    func alertDialouge(title : String,msg : String){
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
}
