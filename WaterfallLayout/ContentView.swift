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
        }
    }
}

struct Card: Hashable {
    let title: String
    let imageName: String
}

let leftCards: [Card] = [
    .init(title: "Kick Boxing",
          imageName: "kickboxing"),
    .init(title: "Boxing",
          imageName: "boxing"),
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
    .init(title: "Run",
          imageName: "boxing")
]

struct CardView: View {
    let card: Card
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
