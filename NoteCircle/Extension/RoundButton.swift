//
//  RoundButton.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 14/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
