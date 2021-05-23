//
//  Date+Utils.swift
//  Airport App
//
//  Created by Jose Torres on 5/16/21.
//

import Foundation

extension Date {

    public func toRequestFormat() -> String {
        return toString()
    }
    
    public func toPresentationFormat() -> String {
        return toString(with: "dd MMM yyyy")
    }
    
    public static func from(_ string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: string)
    }
    
    private func toString(with format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
