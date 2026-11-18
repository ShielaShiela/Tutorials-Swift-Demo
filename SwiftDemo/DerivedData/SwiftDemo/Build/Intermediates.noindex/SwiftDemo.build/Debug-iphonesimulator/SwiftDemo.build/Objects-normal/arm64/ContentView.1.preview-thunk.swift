import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/shielacabahug/Downloads/Tutorials-Swift-Demo/SwiftDemo/SwiftDemo/ContentView.swift", line: 1)
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
                    Label(player.name, systemImage: __designTimeString("#7081_0", fallback: "person"))
                }
            }
            .navigationTitle(__designTimeString("#7081_1", fallback: "Players"))
        }
    }
    
}

struct PlayerDetailView: View {
    let player: Player
    
    var body: some View {
        VStack(spacing: __designTimeInteger("#7081_2", fallback: 16)){
            Text(player.emoji)
                .font(.system(size:__designTimeInteger("#7081_3", fallback: 100)))
            
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
