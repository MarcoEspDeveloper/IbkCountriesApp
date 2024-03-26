//
//  CountriesRepository.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 23/03/2024.
//

import Foundation

class CountriesRepository: CountriesRepositoryProtocol {
    
    let baseUrl = "\(Constants.ConnectionUrl.baseUrl)"
    
    private let dataSource: ServiceDataSourceProtocol?
    
    init() {
        self.dataSource = ServiceDataSource()
    }
    
    func getCountryList(completion: @escaping ([CountryModel]?, (any Error)?) -> Void) {
        
        let urlPath = "\(Constants.ConnectionUrl.baseUrl)\(Constants.ConnectionUrl.allCountriesUrl)"
        
        self.dataSource?.getServiceRequestGet(urlPath: urlPath) { (result) in
            
            switch result {
            case .success(let countries):
                guard let countriesResponse = try? JSONDecoder().decode([CountryModel]?.self, from: countries as! Data) else {
                    
                    let newError = ErrorModel(code: 0, description: NSLocalizedString("GENERAL_ERROR_MESSAGE", comment: ""))
                    
                    completion(nil, newError)
                    
                    return
                }
                
                completion(countriesResponse, nil)
            case .failure(let error):
                let newError = ErrorModel(code: error.code, description: error.localizedDescription)
                
                completion(nil, newError)
            }
        }
    }
}
