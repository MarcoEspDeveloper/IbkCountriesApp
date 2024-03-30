//
//  DetailCountryViewController.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 27/03/2024.
//

import UIKit
import Kingfisher

class DetailCountryViewController: BaseViewController, DetailCountryViewProtocol {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var continentLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!

    var presenter: DetailCountryPresenterProtocol?
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
}

// MARK: - View Methods
extension DetailCountryViewController {
    
    func setupView() {
        
        self.setupNavigationBar()
        self.setupTitle(titleText: self.presenter?.getCountry().name?.common)
        
        self.countryNameLabel.text = self.presenter?.getCountry().name?.official
        
        if let url = URL(string: (self.presenter?.getCountry().flags?["png"])!) {
            
            self.countryFlagImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
        }
        
        // Country name
        let nameAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let nameAttString = NSAttributedString(string: "\((self.presenter?.getCountry().name?.official)!)", attributes: nameAttribute)
        
        let nameFullAttString = NSMutableAttributedString()
        nameFullAttString.append(nameAttString)
        
        // Capital
        let capitalTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let capitalAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let capitalTitleAttString = NSAttributedString(string: "Capital: ", attributes: capitalTitleAttribute)
        
        let capitalAttString = NSAttributedString(string: "\((self.presenter?.getCountry().capital?.first)!)", attributes: capitalAttribute)
        
        let capitalFullAttString = NSMutableAttributedString()
        capitalFullAttString.append(capitalTitleAttString)
        capitalFullAttString.append(capitalAttString)
        
        // Continent
        let continentTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let continentAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let continentTitleAttString = NSAttributedString(string: "Continente: ", attributes: continentTitleAttribute)
        
        let continentAttString = NSAttributedString(string: "\((self.presenter?.getCountry().continents?.first)!)", attributes: continentAttribute)
        
        let continentFullAttString = NSMutableAttributedString()
        continentFullAttString.append(continentTitleAttString)
        continentFullAttString.append(continentAttString)
        
        // Language
        let languageTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let languageAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let languageTitleAttString = NSAttributedString(string: "Idioma: ", attributes: languageTitleAttribute)
        
        let languageAttString = NSAttributedString(string: "\((self.presenter?.getCountry().languages?.first?.value)!)", attributes: languageAttribute)
        
        let languageFullAttString = NSMutableAttributedString()
        languageFullAttString.append(languageTitleAttString)
        languageFullAttString.append(languageAttString)
        
        // Population
        let populationTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let populationAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let populationTitleAttString = NSAttributedString(string: "Población: ", attributes: populationTitleAttribute)
        
        let populationAttString = NSAttributedString(string: "\((self.presenter?.getCountry().population)!)", attributes: populationAttribute)
        
        let populationFullAttString = NSMutableAttributedString()
        populationFullAttString.append(populationTitleAttString)
        populationFullAttString.append(populationAttString)
        
        // Currency
        let currencyTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let currencyAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let currencyTitleAttString = NSAttributedString(string: "Moneda: ", attributes: currencyTitleAttribute)
        
        let currencyAttString = NSAttributedString(string: "\((self.presenter?.getCountry().currencies?.first?.value.name)!) (\((self.presenter?.getCountry().currencies?.first?.value.symbol)!))", attributes: currencyAttribute)
        
        let currencyFullAttString = NSMutableAttributedString()
        currencyFullAttString.append(currencyTitleAttString)
        currencyFullAttString.append(currencyAttString)
        
        // Time zone
        let timeZoneTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let timeZoneAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let timeZoneTitleAttString = NSAttributedString(string: "Zona horaria: ", attributes: timeZoneTitleAttribute)
        
        let timeZoneAttString = NSAttributedString(string: "\((self.presenter?.getCountry().timezones?.first)!)", attributes: timeZoneAttribute)
        
        let timeZoneFullAttString = NSMutableAttributedString()
        timeZoneFullAttString.append(timeZoneTitleAttString)
        timeZoneFullAttString.append(timeZoneAttString)
        
        self.countryNameLabel.attributedText = nameFullAttString
        self.capitalLabel.attributedText = capitalFullAttString
        self.continentLabel.attributedText = continentFullAttString
        self.languageLabel.attributedText = languageFullAttString
        self.populationLabel.attributedText = populationFullAttString
        self.currencyLabel.attributedText = currencyFullAttString
        self.timeZoneLabel.attributedText = timeZoneFullAttString
    }
}
