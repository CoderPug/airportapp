//
//  UITableView+Utils.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import UIKit

extension UITableView {
    
    public func register<T>(_ type: T.Type) {
        let name = String(describing: type)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    public func dequeReusableCell<T>(_ type: T.Type) -> T {
        let name = String(describing: type)
        guard let cell = self.dequeueReusableCell(withIdentifier: name) as? T else {
            fatalError("Trying to dequeue an unregistered cell")
        }
        return cell
    }
    
}
