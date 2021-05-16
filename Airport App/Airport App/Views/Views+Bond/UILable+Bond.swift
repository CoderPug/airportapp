//
//  UILable+Bond.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import UIKit

private var handle: UInt8 = 0;

extension UILabel {
    
    var textBond: Bond<String> {
        if let b = objc_getAssociatedObject(self, &handle) {
            return b as! Bond<String>
        } else {
            let b = Bond<String>() { [unowned self] value in self.text = value }
            objc_setAssociatedObject(self, &handle, b, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return b
        }
    }
    
}
