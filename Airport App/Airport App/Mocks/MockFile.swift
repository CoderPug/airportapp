//
//  MockFile.swift
//  Airport App
//
//  Created by Jose Torres on 5/17/21.
//

import Foundation

typealias MockFile = String

extension MockFile {
    
    static let fileExtension = "json"
    
    func customLoad<T: Decodable>() -> T? {
        
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: self, withExtension: MockFile.fileExtension),
              let data = try? Data(contentsOf: url),
              let element = try? decoder.decode(T.self, from: data)
        else { return nil }
        return element
    }
}
