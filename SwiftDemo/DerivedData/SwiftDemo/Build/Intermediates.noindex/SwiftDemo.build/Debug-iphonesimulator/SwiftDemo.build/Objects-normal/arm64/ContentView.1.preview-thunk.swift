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
    
    @State private var players = [
        Player(name: "Shiela", emoji: "🐱", summary: "dynamic player from Philippines"),
        Player(name: "Hazel", emoji: "🐻", summary: "lovely player from UK"),
        Player(name: "Aloha", emoji: "🐷", summary: "great player from Taiwan.")
    ]
    
    @State private var showAddPlayerSheet = false
    var body: some View {
       
        NavigationStack {
            List(players) {player in
                NavigationLink{
                    PlayerDetailView(player: player)
                } label: {
                    Label(player.name, systemImage: __designTimeString("#1177_0", fallback: "person"))
                }
            }
            .navigationTitle(__designTimeString("#1177_1", fallback: "Players"))
            .toolbar {
                Button(__designTimeString("#1177_2", fallback: "Add"), systemImage: __designTimeString("#1177_3", fallback: "plus")){
                    showAddPlayerSheet = __designTimeBoolean("#1177_4", fallback: true)
                }
            }
            .sheet(isPresented: $showAddPlayerSheet) {
                AddPlayerView { newPlayer in
                    players.append(newPlayer)
                }

            }
        }
    }
    
}

struct PlayerDetailView: View {
    let player: Player
    
    var body: some View {
        VStack(spacing: __designTimeInteger("#1177_5", fallback: 16)){
            Text(player.emoji)
                .font(.system(size:__designTimeInteger("#1177_6", fallback: 100)))
            
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

struct AddPlayerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var emoji = ""
    
    var onSave: (Player) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField(__designTimeString("#1177_7", fallback: "Name"), text: $name)
                TextField(__designTimeString("#1177_8", fallback: "Emoji"), text: $emoji)
            }
            .navigationTitle(__designTimeString("#1177_9", fallback: "New Player"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(__designTimeString("#1177_10", fallback: "Cancel")) { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button(__designTimeString("#1177_11", fallback: "Save")) {
                        onSave(Player(name: name, emoji: emoji, summary: __designTimeString("#1177_12", fallback: "I'm cool")))
                        dismiss()
                    }
                    .disabled((name.isEmpty))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
