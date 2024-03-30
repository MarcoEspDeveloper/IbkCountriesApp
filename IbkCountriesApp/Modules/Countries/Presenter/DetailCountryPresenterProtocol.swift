//
//  DetailCountryPresenterProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 27/03/2024.
//

import Foundation

protocol DetailCountryPresenterProtocol {
    
    func getCountry() -> CountryModel
    func setCountry(country: CountryModel)
    func goToBack()
}
