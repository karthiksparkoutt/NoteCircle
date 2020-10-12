//
//  LoginModel.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 09/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//


import Foundation
import UIKit

struct LoginModel {
    
    var firstName: String
    var lastName: String
    var dateOfBirth: String
    var phoneNumber: String
    var gender: String
    var emailId: String
    var password: String
    var confirmPassword: String
    var isSignInActive: Bool {
        return checkEmptyFields()
    }
    
    init() {
        firstName = ""
        lastName = ""
        dateOfBirth = ""
        phoneNumber = ""
        gender = ""
        emailId = ""
        password = ""
        confirmPassword = ""
    }
    
    init(firstname: String, lastname: String, dateofbirth: String, phonenumber: String, gender: String, emailid: String, password: String, confirmPassword: String) {
        self.firstName = firstname
        self.lastName = lastname
        self.dateOfBirth = dateofbirth
        self.phoneNumber = phonenumber
        self.gender = gender
        self.emailId = emailid
        self.password = password
        self.confirmPassword = confirmPassword
    }
}

extension LoginModel {
    
    func checkEmptyFields() -> Bool {
        if (firstName != "" && lastName != ""  && dateOfBirth != ""  && phoneNumber != ""  && gender != ""  && emailId != "" && password != "" && confirmPassword != "") {
            return true
        }
        else {
            return false
        }
    }
    
    func isFirstName() -> Bool {
        return firstName.count > 3
    }
    
    func isLastName() -> Bool {
        return lastName.count > 3
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailId)
    }
   func isValidGender() -> String? {
       if self.gender.count <= 1 {
        return "please, enter a gender"
    }
    return nil
    }
    func isValidPassword() -> String? {
        if self.password.count <= 1 {
            return "Please, enter a password"
        }
        
        if (password.count < 6) {
            return "Password must not be shorter than 6 characters"
        }
        
        if (!NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password)) {
            return "Password must contain at least one uppercase letter"
        }
        
        if (!NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password)) {
            return "Password must contain at least one lowercase letter"
        }
        
        if (!NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password)) {
            return "Password must contain at least one number"
        }
        
        return nil
    }
    
    func doPasswordsMatch() -> Bool {
        return password == confirmPassword
    }

    func submitTapped(vc: UIViewController) {
        if self.checkEmptyFields() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please fill all Fields")
        }
        else if self.isValidEmail() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid first name")
        }
        else if self.isLastName() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid first name")
        }
            else if self.isLastName() == false {
                    UIAlertController.showSimpleAlert(vc,
                                                      title: "Error",
                                                      message: "Please enter valid first name")
                }    else if self.isLastName() == false {
                        UIAlertController.showSimpleAlert(vc,
                                                          title: "Error",
                                                          message: "Please enter valid first name")
                    }    else if self.isLastName() == false {
                            UIAlertController.showSimpleAlert(vc,
                                                              title: "Error",
                                                              message: "Please enter valid first name")
                        }    else if self.isLastName() == false {
                                UIAlertController.showSimpleAlert(vc,
                                                                  title: "Error",
                                                                  message: "Please enter valid first name")
                            }
        else if self.isValidEmail() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Please enter valid email")
        }
              
        else if let passwordError = isValidPassword(), passwordError != "" {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: passwordError)
        }
        else if self.doPasswordsMatch() == false {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Error",
                                              message: "Password mismatched")
        }
        else {
            UIAlertController.showSimpleAlert(vc,
                                              title: "Success",
                                              message: "Registered successfully")
        }
        
    }
}

extension UIAlertController {
    static func showSimpleAlert(_ vc: UIViewController, title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        vc.present(alertController, animated: true, completion: nil)
    }
}
