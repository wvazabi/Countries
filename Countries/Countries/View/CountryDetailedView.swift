//
//  CountryDetailedView.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI
//

// SD web image package is used to get the images of the flags of the countries.


struct DetailView: View {
  
  @ObservedObject var networkingManager = CountryService()
  @EnvironmentObject var favorites: FavoriteCountries
  @State var countryDetails: CountryDetail?
  var shouldUpdateFavorites: Binding<Bool>?
  let countryCode: String
  
  var body: some View {
      VStack (){
      if countryDetails?.data == nil {
        ProgressView()
      } else {
        ScrollView{
          if let unwrappedDetail = countryDetails?.data {
              VStack(alignment: .leading, spacing: 25) {
              WebImage(url: URL(string: unwrappedDetail.flagImageURI))
                .resizable()
                .scaledToFit()
                .modifier(RoundedEdge(width: 1, color: .black, cornerRadius: 0))
              HStack {
                  
                Text("Country Code:")
                  .fontWeight(.heavy)
                Text(unwrappedDetail.code)
                      
              }
                
              Link("For more information -> ", destination: URL(string: "https://www.wikidata.org/wiki/\(unwrappedDetail.wikiDataID)")!)
                      .padding()
                      .background(Color.init( red: 0.1, green: 0.1, blue: 0.9))
                          .foregroundColor(.white)
                          .font(.title3)
                
               
            }
          }
        }
      }
    }
    .onAppear{
        CountryService().fetchCountryDetails( countryCode: countryCode) { (countryDetails) in
        self.countryDetails = countryDetails
      }
    }.onDisappear{
      self.shouldUpdateFavorites?.wrappedValue = true
    }
    .navigationTitle(countryDetails?.data.name ?? "")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      Button{
        favorites.CountryToggle(countryCode)
      } label: {
        Image(systemName: favorites.contains(countryCode) ? "star.fill" : "star")
              .foregroundColor(.yellow)
      }
    }.buttonStyle(PlainButtonStyle())
          .padding(.horizontal, 20)
  }
}



