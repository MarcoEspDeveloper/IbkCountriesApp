//
//  DetailCountryPresenter.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 27/03/2024.
//

import Foundation

class DetailCountryPresenter: DetailCountryPresenterProtocol {
    
    weak var view: DetailCountryViewProtocol!
    var router: DetailCountryRouterProtocol?
    
    var country: CountryModel = CountryModel()
    
    init(view: DetailCountryViewProtocol, router: DetailCountryRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func getCountry() -> CountryModel {
        
        return self.country
    }
    
    func setCountry(country: CountryModel) {
        
        self.country = country
    }
    
    func goToBack() {
        self.router?.goToBack()
    }
}
