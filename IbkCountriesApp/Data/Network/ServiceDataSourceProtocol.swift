//
//  ServiceDataSourceProtocol.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation

protocol ServiceDataSourceProtocol {
    
    func getServiceRequestGet(urlPath: String, completion: @escaping (Result<Any?, NSError>) -> Void)
}
