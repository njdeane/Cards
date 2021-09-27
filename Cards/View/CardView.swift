//
//  CardsView.swift
//  Cards
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct CardView: View {
  
  var card: Card
  
  var body: some View {
    ZStack {
      Image(card.imageName)
      
      VStack {
        Text(card.title)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .foregroundColor(Color.white)
          .multilineTextAlignment(.center)
        Text(card.headline)
          .fontWeight(.light)
          .foregroundColor(Color.white)
          .italic()
      }
      .offset(y: -218)
      
      Button(action: {
        print("Button was tapped")
      }, label: {
        HStack {
          Text(card.callToAction.uppercased())
            .fontWeight(.heavy)
            .foregroundColor(Color.white)
            .accentColor(Color.white)
          
          Image(systemName: "arrow.right.circle")
            .font(Font.title.weight(.medium))
            .accentColor(Color.white)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 6, x: 0.0, y: 3)
      })
      .offset(y: 210)
    }
    .frame(width: 355, height: 545)
    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(16)
    .shadow(radius: 8)
  }
}

struct CardsView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: cardData[1])
      .previewLayout(.sizeThatFits)
  }
}
