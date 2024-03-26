//
//  PresenterInteractor.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

class CountriesInteractor: CountriesInteractorProtocol {
    
    var presenter: CountriesPresenterProtocol?
    var repository: CountriesRepositoryProtocol?
    
    init(presenter: CountriesPresenterProtocol) {
        
        self.presenter = presenter
        self.repository = CountriesRepository()
    }
    
    func getCountryList() {
        
        self.repository?.getCountryList() { (response, error) in
            
            if let countriesResponse = response {
                
                self.presenter?.didGetCountryList(countryList: countriesResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetCountryList(error: error as! ErrorModel)
            }
        }
    }
}
