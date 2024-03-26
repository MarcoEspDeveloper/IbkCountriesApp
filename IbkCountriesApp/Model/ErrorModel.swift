//
//  ErrorModel.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

struct ErrorModel: Error {
    
    var code: Int?
    var description: String?
    
    init(code: Int?, description: String?) {
        
        self.code = code
        self.description = description
    }
}
