//
//  CountriesPresenterProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

protocol CountriesPresenterProtocol {
    
    func getCountryList()
    func didGetCountryList(countryList: [CountryModel])
    func failGetCountryList(error: ErrorModel)
    
    func getCountries() -> [CountryModel]
    func getSearchedCountries() -> [CountryModel]
    func setSearchedCountries(movies: [CountryModel])
    func clearSearchedCountries()
    
    func goToDetail(movie: CountryModel)
    func goToErrorPopUp(title: String, message: String)
}
