//
//  ContentView.swift
//  SwiftDemo
//
//  Created by Shiela Cabahug on 2026/11/12.
//
//
//  ContentView.swift
//  sampleAPP
//
//  Created by Shiela Cabahug on 2026/10/23.
//

import SwiftUI

struct Player: Identifiable {
    
    let id = UUID()
    let name: String
    let emoji: String
    let summary: String
    
}

struct ContentView: View {
    
    let players = [
        Player(name: "Shiela", emoji: "🐱", summary: "dynamic player from Philippines"),
        Player(name: "Hazel", emoji: "🐻", summary: "lovely player from UK"),
        Player(name: "Aloha", emoji: "🐷", summary: "great player from Taiwan.")
    ]
    
    var body: some View {
       
        NavigationStack {
            List(players) {player in
                NavigationLink{
                    PlayerDetailView(player: player)
                } label: {
                    Label(player.name, systemImage: "person")
                }
            }
            .navigationTitle("Players")
        }
    }
    
}

struct PlayerDetailView: View {
    let player: Player
    
    var body: some View {
        VStack(spacing: 16){
            Text(player.emoji)
                .font(.system(size:100))
            
            Text(player.name)
                .font(.largeTitle)
                .bold()
            
            Text(player.summary)
                .foregroundStyle(.secondary)
        
        }
        .navigationTitle(player.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
#Preview {
    ContentView()
}
