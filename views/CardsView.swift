//
//  CardsView.swift
//  War Card Game
//
//  Created by Sergei Biryukov on 01.01.2026.
//

import SwiftUI

struct CardsView: View {
    @State private var card1 = 1
    @State private var card2 = 1
    
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    @State private var rounds = 0
    @State private var isGameOver: Bool = false
    
    var body: some View {
        VStack {
            HStack(spacing: 60) {
                Image("card\(card1)")

                Image("card\(card2)")
            }
            .padding(.bottom, 40)
            
            Button {
                changeCard()
            } label: {
                Image("button")
            }
            .alert("Game over", isPresented: $isGameOver) {
                Button("New Game", role: .cancel) {
                    rounds = 0
                    playerScore = 0
                    cpuScore = 0
                    card1 = 1
                    card2 = 1
                }
            } message: {
                Text(showTheWinner())
            }
            
            HStack {
                Spacer()
                VStack {
                    Text("Player")
                        .font(.title2)
                        .bold()
                    Text("\(playerScore)")
                        .font(.title)
                }
                Spacer()
                VStack {
                    Text("CPU")
                        .font(.title2)
                        .bold()
                    Text("\(cpuScore)")
                        .font(.title)
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding(.top, 40)
            
        }
    }
    
    func changeCard() {
        card1 = Int.random(in: 2...14)
        card2 = Int.random(in: 2...14)
        
        if card1 > card2 {
            playerScore += 1
            rounds += 1
        } else if card2 > card1 {
            cpuScore += 1
            rounds += 1
        }
        
        if rounds == 5 {
            isGameOver = true
        }
    }
    
    func showTheWinner() -> String {
        if playerScore > cpuScore {
            return "Player wins with score \(playerScore)!"
        } else if cpuScore > playerScore {
            return "CPU wins with score \(cpuScore)!"
        } else {
            return "Equals with score \(playerScore) and \(cpuScore)!"
        }
    }
}

#Preview {
    CardsView()
}
