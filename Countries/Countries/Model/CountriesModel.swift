//
//  CountriesModel.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//
import SwiftUI

struct Countries: Codable {
  let data: [CountryResult]
}

struct CountryResult: Codable, Identifiable, Hashable {
  let code: String
  let name: String
  var id: String { code }
  
  enum CodingKeys: String, CodingKey {
    case code, name
  }
}

struct CountryDetail: Codable {
  let data: CountryDetails
  
}
struct CountryDetails: Codable {
  let name: String
  let code: String
  let flagImageURI: String
  let wikiDataID: String
  
  enum CodingKeys: String, CodingKey {
    case wikiDataID = "wikiDataId"
    case flagImageURI = "flagImageUri"
    case name, code
  }
}
