//
//  CountriesApp.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//


import SwiftUI
import SDWebImage
import SDWebImageSVGCoder
@main
struct CountriesApp: App {
  init() {
    setUpDependencies()
  }
  var body: some Scene {
    WindowGroup {
      LandingView()
    }
  }
}


private extension CountriesApp {
  func setUpDependencies() {
    SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
  }
}
