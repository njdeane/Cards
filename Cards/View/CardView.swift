//
//  CardsView.swift
//  Cards
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct CardView: View {
  
  var card: Card
  var haptics = UIImpactFeedbackGenerator(style: .heavy)
  
  @State private var fadeIn: Bool = false
  @State private var moveDown: Bool = false
  @State private var moveUp: Bool = false
  @State private var showAlert: Bool = false
  
  var body: some View {
    ZStack {
      Image(card.imageName)
        .opacity(fadeIn ? 1.0 : 0.0)
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
      .offset(y: moveDown ? -218 : -300)
      
      Button(action: {
        playSound(sound: "sound-chime", type: "mp3")
        self.haptics.impactOccurred()
        self.showAlert.toggle()
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
      .offset(y: moveUp ? 210 : 300)
    }
    .frame(width: 355, height: 545)
    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(16)
    .shadow(radius: 8)
    .onAppear() {
      withAnimation(.linear(duration: 1.2)) {
        self.fadeIn.toggle()
      }
      withAnimation(.linear(duration: 0.8)) {
        self.moveDown.toggle()
        self.moveUp.toggle()
      }
    }
    .alert(isPresented: $showAlert, content: {
      Alert(
        title: Text(card.title),
        message: Text(card.message),
        dismissButton: .default(Text("OK")))
    })
  }
}

struct CardsView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: cardData[1])
      .previewLayout(.sizeThatFits)
  }
}
