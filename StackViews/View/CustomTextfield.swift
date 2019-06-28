//
//  CustomTextfield.swift
//  StackViews
//
//  Created by Mezut on 28/06/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    
    // Overall padding of the textfield
    let padding = UIEdgeInsets(top: 5, left: 13, bottom: 5, right: 13)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
