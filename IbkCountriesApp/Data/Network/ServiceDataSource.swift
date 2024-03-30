//
//  ServiceDataSource.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 26/01/2024.
//

import Foundation
import Alamofire
import Reachability

class ServiceDataSource: ServiceDataSourceProtocol {
    
    private var sessionManager: Session?
    var reachability: Reachability!
    
    init() {
        
        self.reachability = try! Reachability()
        
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        
        self.sessionManager = Session(configuration: configuration)
    }
    
    func isInternetConnected() -> Bool {
        
        var isConnected = false
        
        if self.reachability.connection != .unavailable {
            
            isConnected = true
        }
        
        return isConnected
    }
    
    func getServiceRequestGet(urlPath: String, completion: @escaping (Result<Any?, NSError>) -> Void) {
        
        let url = urlPath
        
        if !self.isInternetConnected() {
            
            let userInfo: [String: Any] =
                        [NSLocalizedDescriptionKey:  NSLocalizedString("INTERNET_ERROR_MESSAGE", comment: ""),
                  NSLocalizedFailureReasonErrorKey: NSLocalizedString("INTERNET_ERROR_MESSAGE", comment: "")]
            
            let newError = NSError(domain: "ShiploopHttpResponseErrorDomain", code: 401, userInfo: userInfo)
            print("Error in Post: \(newError.localizedDescription)")
            
            completion(.failure(newError))
            
            return
        }
        
        self.sessionManager?.request(url).validate().responseData(completionHandler: { (response) in
            
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                let newError = NSError(domain: url, code: (response.response?.statusCode ?? 0)!, userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                
                completion(.failure(newError))
            }
        })
    }
}
