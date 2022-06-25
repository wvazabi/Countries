//
//  Constants.swift
//  Countries
//
//  Created by Enes Kaya on 25.06.2022.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {}, label: {
        configuration.label.foregroundColor(.white)
      }
    )
    .allowsHitTesting(false)
    .padding()
    .background(Color.gray.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

//RapidAPI user key and host

struct Constants {
    static let host = "wft-geo-db.p.rapidapi.com"
    static let apiKey = "XXXXXXXXXXXXXXXXXXXXX"
}

struct RoundedEdge: ViewModifier {
    let width: CGFloat
    let color: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.cornerRadius(cornerRadius - width)
            .padding(width)
            .background(color)
            .cornerRadius(cornerRadius)
    }
}






