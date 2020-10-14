//
//  LoginModel.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 09/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//


import Foundation


class TextFieldValidation {
    
    
     func nameValidation(_ name :String) -> Bool{
        
        let nameRegEx = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let nameStringTrim = name.trimmingCharacters(in: .whitespaces)
        let ValidateName = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        let isValidateName = ValidateName.evaluate(with: nameStringTrim)
        return isValidateName
        
        
        
    }
     func emailValidation(_ email : String ) -> Bool{
        
        let emailReEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailStringTrim =  email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format: "SELF MATCHES %@", emailReEx)
        let isEmailValidate = validateEmail.evaluate(with: emailStringTrim)
        
        return isEmailValidate
        
        
    }
    
     func phoneNumberValidation(_ phone :String) -> Bool{
        
        let phoneReEx = "^[0]\\d{10}$" //11 digits bangladeshi phn number
        let phoneStringTrim = phone.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneReEx)
        let isValidatePhone = validatePhone.evaluate(with: phoneStringTrim)
        return isValidatePhone
        
        
    }
    
     func passwordValidation(_ password : String) -> Bool{
        
        let pwReEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let pwStringTrmin = password.trimmingCharacters(in: .whitespaces)
        let validatePw = NSPredicate(format: "SELF MATCHES %@", pwReEx)
        let isValidatePw = validatePw.evaluate(with: pwStringTrmin)
        return isValidatePw
        
        
    }
    
    
    
    
}
