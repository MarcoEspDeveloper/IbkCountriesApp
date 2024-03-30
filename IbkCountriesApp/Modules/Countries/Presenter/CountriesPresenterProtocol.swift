//
//  CountriesPresenterProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

protocol CountriesPresenterProtocol {
    
    func getCountryList()
    func getCountryListByName(name: String)
    func didGetCountryList(countryList: [CountryModel])
    func failGetCountryList(error: ErrorModel)
    func didGetCountryListByName(countryList: [CountryModel])
    func failGetCountryListByName(error: ErrorModel)
    
    func getCountries() -> [CountryModel]
    
    func goToDetail(country: CountryModel)
    func goToErrorPopUp(title: String?, message: String?)
}
