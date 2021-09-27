//
//  ContentView.swift
//  Cards
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct ContentView: View {
  
  var cards: [Card] = cardData
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        ForEach(cards) { item in
          CardView(card: item)
        }
      }
      .padding(20)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(cards: cardData)
  }
}
