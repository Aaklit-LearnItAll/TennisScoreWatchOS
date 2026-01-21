//
//  TenniscoreApp.swift
//  Tenniscore Watch App
//
//  Created by Aaklit Taneja on 21/01/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var myPoints = 0
    @State private var opponentPoints = 0
    @State private var myGames = 0
    @State private var opponentGames = 0
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with game count and reset
            HStack {
                Text("Games: \(myGames)-\(opponentGames)")
                    .font(.caption2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: resetMatch) {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.caption2)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.gray.opacity(0.2))
            
            // My score (top half)
            Button(action: { addPoint(for: .me) }) {
                VStack {
                    Text("ME")
                        .font(.caption2)
                        .opacity(0.7)
                    Text(scoreDisplay(for: .me))
                        .font(.system(size: 50, weight: .bold))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
            }
            .buttonStyle(.plain)
            
            Divider()
                .background(Color.black)
            
            // Opponent score (bottom half)
            Button(action: { addPoint(for: .opponent) }) {
                VStack {
                    Text(scoreDisplay(for: .opponent))
                        .font(.system(size: 50, weight: .bold))
                    Text("OPP")
                        .font(.caption2)
                        .opacity(0.7)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
            }
            .buttonStyle(.plain)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    enum Player {
        case me, opponent
    }
    
    func scoreDisplay(for player: Player) -> String {
        let points = player == .me ? myPoints : opponentPoints
        let otherPoints = player == .me ? opponentPoints : myPoints
        
        // Handle deuce and advantage
        if myPoints > 3 && opponentPoints > 3 {
            if myPoints == opponentPoints {
                return "40" // Deuce
            } else {
                return points > otherPoints ? "AD" : "40"
            }
        }
        
        // Normal scoring
        switch points {
        case 0: return "0"
        case 1: return "15"
        case 2: return "30"
        case 3: return "40"
        default: return "A"
        }
    }
    
    func addPoint(for player: Player) {
        if player == .me {
            myPoints += 1
            if checkGameWin(playerPoints: myPoints, opponentPoints: opponentPoints) {
                myGames += 1
                resetGame()
            }
        } else {
            opponentPoints += 1
            if checkGameWin(playerPoints: opponentPoints, opponentPoints: myPoints) {
                opponentGames += 1
                resetGame()
            }
        }
        
        // Haptic feedback
        WKInterfaceDevice.current().play(.click)
    }
    
    func checkGameWin(playerPoints: Int, opponentPoints: Int) -> Bool {
        return playerPoints > 3 && playerPoints - opponentPoints >= 2
    }
    
    func resetGame() {
        myPoints = 0
        opponentPoints = 0
    }
    
    func resetMatch() {
        myPoints = 0
        opponentPoints = 0
        myGames = 0
        opponentGames = 0
        WKInterfaceDevice.current().play(.success)
    }
}

@main
struct TennisScoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
