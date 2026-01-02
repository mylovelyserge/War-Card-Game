//
//  ContentView.swift
//  War Card Game
//
//  Created by Sergei Biryukov on 31.12.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
           Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("logo")
                Spacer()
                
                CardsView()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
