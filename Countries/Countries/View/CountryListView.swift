//
//  CountryListView.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//

import SwiftUI

struct CountryListView: View {
  
  @EnvironmentObject var favorites: FavoriteCountries
  @Binding var countries: Countries?
  
  var body: some View {
    VStack{
      if countries?.data == nil {
        ProgressView()
      } else {
        NavigationView {
          if let unWrappedData = countries?.data {
            List(unWrappedData) { country in
              NavigationLink(destination: DetailView(countryCode: country.code)) {
                HStack {
                  Text(country.name)
                  Spacer()
                  Button {
                    favorites.CountryToggle(country.code)
                  } label: {
                    Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                          .foregroundColor(.yellow)
                  }.buttonStyle(PlainButtonStyle())
                        
                }
              }
            }.listStyle(PlainListStyle())
              .navigationBarTitle("Countries")
          }
        }
      }
    }
  }
}
