//
//  FavoriteCountries.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//


import SwiftUI

class FavoriteCountries: ObservableObject {
  var CodeOfCountry: Set<String>
  
  private let favoriteKey = "Favorites"
  
  init() {
    self.CodeOfCountry = []
    self.CountryFavLoad()
  }
  
  func contains(_ countryCode: String) -> Bool {
    CodeOfCountry.contains(countryCode)
  }
  
  func CountryFavAdd(_ countryCode: String) {
    objectWillChange.send()
    CodeOfCountry.insert(countryCode)
    CountryFavSave()
  }
  
  func CountryFavRemove(_ countryCode: String) {
    objectWillChange.send()
    CodeOfCountry.remove(countryCode)
    CountryFavSave()
  }

  func CountryFavSave() {
    do {
      let fileName = getDocumentsDirectory().appendingPathComponent("SavedCountries")
      let countryIds = Array(self.CodeOfCountry)
      let data = try JSONEncoder().encode(countryIds)
      try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
      print("Country data saved")
    } catch {
      print("Unable to save data")
    }
  }
  
  func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  func CountryFavLoad() {
    let fileName = getDocumentsDirectory().appendingPathComponent("SavedCountries")
    do {
      let data = try Data(contentsOf: fileName)
      let countryIds = try JSONDecoder().decode([String].self, from: data)
      CodeOfCountry = Set(countryIds)
    } catch {
      print("Unable to load saved data.")
    }
  }
  
  func CountryToggle(_ countryCode: String) {
    if self.contains(countryCode) {
      self.CountryFavRemove(countryCode)
    } else {
      self.CountryFavAdd(countryCode)
    }
  }
}
