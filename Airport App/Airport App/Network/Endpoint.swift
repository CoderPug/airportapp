//
//  Request.swift
//  Airport App
//
//  Created by Jose Torres on 4/29/21.
//

import Foundation

typealias Path = String

public struct Endpoint<Response> {
    
    let method: Method
    let path: Path
    let body: Data   
}
