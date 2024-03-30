//
//  CountriesRouter.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import Foundation
import UIKit

class CountriesRouter {
    
    private weak var countriesView: CountriesViewProtocol!
    
    init(withView view: CountriesViewProtocol) {
        self.countriesView = view
    }
}

extension CountriesRouter: CountriesRouterProtocol {
    
    func goToDetail(country: CountryModel) {
        
        let detailCountryVC = CountriesAssembly.detailBuild(country: country)
        (self.countriesView as! CountriesViewController).navigationController?.pushViewController(detailCountryVC, animated: true)
    }
    
    func showErrorPopUp(title: String, message: String) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertVC.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        
        let originViewController = self.countriesView as! CountriesViewController
        originViewController.present(alertVC, animated: true, completion: nil)
    }
}
