//
//  BondBox.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import Foundation

class BondBox<T> {
    
    weak var bond: Bond<T>?
    
    init(_ bond: Bond<T>) {
        self.bond = bond
    }
    
}
