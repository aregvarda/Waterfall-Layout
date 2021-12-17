//
//  ContentView.swift
//  WaterfallLayout
//
//  Created by Геворг on 17.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack {
                    ForEach(Array(leftCards.enumerated()), id: \.element) { offset, card in
                        CardView(card: card)
                            .frame(height: offset % 2 == 0 ? 320 : 200)
                    }
                }
                VStack {
                    ForEach(Array(rightCards.enumerated()), id: \.element) { offset, card in
                        CardView(card: card)
                            .frame(height: offset % 2 != 0 ? 320 : 200)
                    }
                }
            }.padding()
        }.navigationBarTitle("Categories")
            .navigationBarItems(leading: Button {
                
            } label: {
                Image(systemName: "arrow.backward")
            }, trailing: Button {
            } label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

struct Card: Hashable {
    let title: String
    let imageName: String
}

let leftCards: [Card] = [
    .init(title: "Kick Boxing",
          imageName: "kickboxing"),
    .init(title: "Run",
          imageName: "run"),
    .init(title: "Morning",
          imageName: "morning"),
    .init(title: "Fitness",
          imageName: "fitness")
]

let rightCards: [Card] = [
    .init(title: "Pilates",
          imageName: "morning"),
    .init(title: "Intervals",
          imageName: "intervals"),
    .init(title: "Yoga",
          imageName: "yoga"),
    .init(title: "Boxing",
          imageName: "boxing")
]

struct CardView: View {
    let card: Card
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                Text(card.title.uppercased())
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(8)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }.accentColor(.primary)
    }
}
