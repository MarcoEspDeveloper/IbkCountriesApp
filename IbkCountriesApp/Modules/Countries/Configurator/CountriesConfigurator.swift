//
//  CountriesConfigurator.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation

class CountriesConfigurator: CountriesConfiguratorProtocol {
 
    func configure(viewController: CountriesViewController) {
        viewController.presenter = CountriesPresenter(view: viewController)
    }
}
