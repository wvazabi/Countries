//
//  CountryFavoritesView.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//

import SwiftUI

struct FavoritesView: View {
  
  @EnvironmentObject var favorites: FavoriteCountries
  @Binding var countries: Countries?
  @State var localFavorites = Set<String>()
  @State var shouldUpdateFavorites: Bool = false
  
  var body: some View {
    VStack{
      if countries?.data == nil {
        ProgressView()
      } else {
        NavigationView {
          if let unWrappedData = countries?.data {
            List(unWrappedData.filter({localFavorites.contains($0.code)})) { country in
              NavigationLink(destination: DetailView(shouldUpdateFavorites: $shouldUpdateFavorites, countryCode: country.code)) {
                HStack {
                  Text(country.name)
                  Spacer()
                  Button {
                    favorites.CountryToggle(country.code)
                    self.localFavorites = favorites.CodeOfCountry
                  } label: {
                    Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                          .foregroundColor(.yellow)
                  }.buttonStyle(PlainButtonStyle())
                }
              }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Countries")
          }
        }.onAppear{
          self.localFavorites = favorites.CodeOfCountry
        }.onChange(of: shouldUpdateFavorites) { _ in
          if shouldUpdateFavorites {
            self.localFavorites = favorites.CodeOfCountry
            shouldUpdateFavorites = false
          }
        }
      }
    }
  }
}

