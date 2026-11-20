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
                    Label(player.name, systemImage: "person")
                }
            }
            .navigationTitle("Players")
            .toolbar {
                Button("Add", systemImage: "plus"){
                    showAddPlayerSheet = true
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

struct AddPlayerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var emoji = ""
    
    var onSave: (Player) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Emoji", text: $emoji)
            }
            .navigationTitle("New Player")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save") {
                        onSave(Player(name: name, emoji: emoji, summary: "I'm cool"))
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
