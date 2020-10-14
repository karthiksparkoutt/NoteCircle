//
//  ValidationPreferences.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 14/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

enum Validation {
    case required(message: String)               
    case letter(message: String)
    case maxLength(value: Int, message: String)
    case minLength(value: Int, message: String)
    case email(message: String)
    case mobile(message: String)
    case password(message: String)
    case characterRange(min:Int, max:Int, message: String)
    case alphaNumeric(message: String)
    case range(min:Int, max:Int, message: String)
}

struct ValidationPreferences {
    static let letterRegEx          = "[^a-zA-Z ]"
    static let alphaNumericRegEx    = "[^a-zA-Z0-9 ]"
    static let numericRegEx         = "[^0-9]"
    static let emailRegEx           = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    static let passwordRegEx        = "(.{6,12})"
    static let domain               = "VALIDATIONFAILED"
    static let errorCode            = 501
}
