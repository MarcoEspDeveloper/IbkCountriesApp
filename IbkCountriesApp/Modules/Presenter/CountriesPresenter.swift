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
    var searchCountryList: [CountryModel] = []
    
    init(view: CountriesViewProtocol) {
        self.countriesView = view
        self.interactor = CountriesInteractor(presenter: self)
        self.router = CountriesRouter(withView: self.countriesView)
    }
    
    func getCountryList() {
        
        self.interactor?.getCountryList()
    }
    
    func didGetCountryList(countryList: [CountryModel]) {
        
        self.countryList = countryList
        
        self.countriesView.showCountryList()
    }
    
    func failGetCountryList(error: ErrorModel) {
        
        self.countriesView.showBasicAlert(title: NSLocalizedString("ERROR_TITLE", comment: ""), message: error.description)
    }
    
    func getCountries() -> [CountryModel] {
        return self.countryList
    }
    
    func getSearchedCountries() -> [CountryModel] {
        return self.searchCountryList
    }
    
    func setSearchedCountries(movies: [CountryModel]) {
        
    }
    
    func clearSearchedCountries() {
        
    }
    
    func goToDetail(movie: CountryModel) {
        
    }
    
    func goToErrorPopUp(title: String, message: String) {
        
        self.router?.showErrorPopUp(title: title, message: message)
    }
}
