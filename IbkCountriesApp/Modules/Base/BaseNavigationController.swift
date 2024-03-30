//
//  BaseNavigationController.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 30/03/2024.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
}
