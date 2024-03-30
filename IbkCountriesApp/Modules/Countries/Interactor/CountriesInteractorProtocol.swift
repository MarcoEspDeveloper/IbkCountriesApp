//
//  PresenterInteractorProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

protocol CountriesInteractorProtocol {
    
    func getCountryList()
    func getCountryListByName(name: String)
}
