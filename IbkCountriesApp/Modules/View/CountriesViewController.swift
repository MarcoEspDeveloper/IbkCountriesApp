//
//  CountriesViewController.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 18/03/2024.
//

import UIKit
import MBProgressHUD

class CountriesViewController: UIViewController {

    @IBOutlet weak var countriesSearchBar: UISearchBar!
    @IBOutlet weak var countriesTableView: UITableView!
    
    var presenter: CountriesPresenterProtocol?
    var configurator: CountriesConfiguratorProtocol?
    
    var isLoadingList = false
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = CountriesConfigurator()
        self.configurator?.configure(viewController: self)
        
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        self.setupView()
    }
}

extension CountriesViewController {
    
    func setupView() {
        
        let countriesSearchToolBar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Listo", style: .plain, target: self, action: #selector(handleViewTap))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        countriesSearchToolBar.items = [flexSpace, flexSpace, doneBtn]
        countriesSearchToolBar.sizeToFit()
        
        countriesSearchBar.returnKeyType = .done
        countriesSearchBar.showsCancelButton = true
        
        self.presenter?.getCountryList()
    }
    
    @objc func handleViewTap() {
        view.endEditing(true)
    }
}

extension CountriesViewController: UISearchBarDelegate {
    
    
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let countCountries = self.presenter?.getCountries().count, countCountries > 0 {
            
            return countCountries
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let country = self.presenter?.getCountries()[indexPath.row] {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
            
            cell.setupCell(name: country.name?.common, flag: country.flags?["png"])
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension CountriesViewController: CountriesViewProtocol {
    
    func showBasicAlert(title: String?, message: String?) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        self.presenter?.goToErrorPopUp(title: title ?? "", message: message ?? "")
    }
    
    func showCountryList() {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        self.countriesTableView.reloadData()
    }
}