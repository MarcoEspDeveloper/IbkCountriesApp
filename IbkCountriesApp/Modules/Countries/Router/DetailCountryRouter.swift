//
//  DetailCountryRouter.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 27/03/2024.
//

import Foundation

class DetailCountryRouter {
    
    private weak var detailCountryViewController: DetailCountryViewController!
    
    init(withView view: DetailCountryViewController) {
        self.detailCountryViewController = view
    }
}

extension DetailCountryRouter: DetailCountryRouterProtocol {
    
    func goToBack() {
        
        self.detailCountryViewController.navigationController?.popViewController(animated: true)
    }
}
