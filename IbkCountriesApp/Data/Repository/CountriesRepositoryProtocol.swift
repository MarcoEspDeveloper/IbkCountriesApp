//
//  CountriesRepositoryProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 23/03/2024.
//

import Foundation

protocol CountriesRepositoryProtocol {
    
    func getCountryList(completion: @escaping ([CountryModel]?, Error?) -> Void)
}
