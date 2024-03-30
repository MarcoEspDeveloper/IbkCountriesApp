//
//  CountriesAssembly.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 30/03/2024.
//

import Foundation
import UIKit

class CountriesAssembly {
    
    static func detailBuild(country: CountryModel) -> DetailCountryViewController {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailCountryViewController") as! DetailCountryViewController
        let router = DetailCountryRouter(withView: viewController)
        let presenter = DetailCountryPresenter(view: viewController, router: router)
        presenter.setCountry(country: country)
        viewController.presenter = presenter
        
        return viewController
    }
}
