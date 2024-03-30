//
//  CountriesRouterProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

protocol CountriesRouterProtocol {
    
    func goToDetail(country: CountryModel)
    func showErrorPopUp(title: String, message: String)
}
