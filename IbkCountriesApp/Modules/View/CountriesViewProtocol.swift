//
//  CountriesViewProtocol.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

protocol CountriesViewProtocol: AnyObject {
    
    func showBasicAlert(title: String, message: String)
    func showCountryList()
}
