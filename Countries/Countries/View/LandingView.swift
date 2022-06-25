//
//  LandingView.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//

import SwiftUI

struct BannerView : View {
    
    var text : String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(text)
                Spacer()
            }.background(Color.gray)
            
        }
    }
}

struct LandingView: View {
  @State var country: Countries?
  @ObservedObject var favorites = FavoriteCountries()

  var body: some View {
      
      TabView() {
          
      CountryListView(countries: $country)
              
          .tabItem{
            Label("Home", systemImage: "house.fill")
                
                
        }
      FavoritesView(countries: $country)
        .tabItem{
            Label("Saved", systemImage: "heart.square.fill")
        }
        
              
      }.onAppear{
        
        
        UITabBar.appearance().barTintColor = UIColor.gray
          CountryService().fetchCountries { (countries ) in
          self.country = countries
      }
    }
          .accentColor(.black)
          .environmentObject(favorites)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    LandingView()
     
  }
}
