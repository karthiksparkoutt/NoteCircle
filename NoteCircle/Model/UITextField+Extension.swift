//
//  UITextField+Extension.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 14/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
