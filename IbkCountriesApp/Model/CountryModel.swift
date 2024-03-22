//
//  CountryModel.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 18/03/2024.
//

import Foundation

struct CountryModel: Codable {
    
    var name: CountryName?
    var tld: [String]?
    var cca2: String?
    var ccn3: String?
    var cca3: String?
    var cioc: String?
    var independent: Bool?
    var status: String?
    var unMember: Bool?
    var currencies: [String: CountryCurrencies]?
    var capital: [String]?
    var altSpellings: [String]?
    var region: String?
    var subregion: String?
    var languages: [String: String]?
    var translations: [String: CountryTranslationName]?
    var latlng: [Float]?
    var borders: [String]?
    var area: Float?
    var demonyms: [String: CountryDemonyms]?
    var flag: String?
    var maps: [String: String]?
    var population: Int64?
    var gini: [String: Float]?
    var fifa: String?
    var car: CountryCar?
    var timezones: [String]?
    var continents: [String]?
    var flags: [String: String]?
    var coatOfArms: [String: String]?
    var startOfWeek: String?
    var capitalInfo: CountryCapitalInfo?
    var postalCode: [String: String]?
}

struct CountryName: Codable {
    
    var common: String?
    var official: String?
    var nativeName: [String: CountryTranslationName]?
}

struct CountryCurrencies: Codable {
    
    var name: String?
    var symbol: String?
}

struct CountryTranslationName: Codable {
    
    var official: String?
    var common: String?
}

struct CountryCar: Codable {
    
    var signs: [String]?
    var side: String?
}

struct CountryCapitalInfo: Codable {
    
    var latlng: [Float]?
}

struct CountryIdd: Codable {
    
    var root: String?
    var suffixes: [String]?
}

struct CountryDemonyms: Codable {
    
    var f: String?
    var m: String?
}
