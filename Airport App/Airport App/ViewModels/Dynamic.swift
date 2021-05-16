//
//  Dynamic.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import Foundation

final class Dynamic<T> {
    
    var value: T {
        didSet {
            for b in bonds {
                b.bond?.listener(value)
            }
        }
    }
    
    var bonds: [BondBox<T>] = []
    
    init(_ value: T) {
        self.value = value
    }
}
