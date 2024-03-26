//
//  CountriesPresenter.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

class CountriesPresenter: CountriesPresenterProtocol {
    
    weak var countriesView: CountriesViewProtocol!
    var interactor: CountriesInteractorProtocol?
    var router: CountriesRouterProtocol?
    
    var countryList: [CountryModel] = []
    
    init(view: CountriesViewProtocol) {
        self.countriesView = view
        self.interactor = CountriesInteractor(presenter: self)
        self.router = CountriesRouter(withView: self.countriesView)
    }
    
    func getCountryList() {
        
        self.interactor?.getCountryList()
    }
    
    func getCountryListByName(name: String) {
        
        self.interactor?.getCountryListByName(name: name.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current))
    }
    
    func didGetCountryList(countryList: [CountryModel]) {
        
        self.countryList = countryList
        
        self.countriesView.showCountryList()
    }
    
    func failGetCountryList(error: ErrorModel) {
        
        let errorMessage = error.description ?? ""
        
        self.countriesView.showBasicAlert(title: NSLocalizedString("ERROR_TITLE", comment: ""), message: errorMessage)
    }
    
    func didGetCountryListByName(countryList: [CountryModel]) {
        
        self.countryList = countryList
        
        self.countriesView.showCountryList()
    }
    
    func failGetCountryListByName(error: ErrorModel) {
        
        let errorMessage = error.description ?? ""
        
        self.countriesView.showBasicAlert(title: NSLocalizedString("ERROR_TITLE", comment: ""), message: errorMessage)
    }
    
    func getCountries() -> [CountryModel] {
        return self.countryList
    }
    
    func goToDetail(movie: CountryModel) {
        
    }
    
    func goToErrorPopUp(title: String?, message: String?) {
        
        let errorTitle = title ?? ""
        let errorMessage = message ?? ""
        
        self.router?.showErrorPopUp(title: errorTitle, message: errorMessage)
    }
}
