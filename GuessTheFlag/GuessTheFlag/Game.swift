//
//  Game.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

struct Game: View {
        
    @State var countries: [String]

    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var showingScore = false
    @State private var endingGame = false
    @State private var scoreTitle = String()
    @State private var score = 0
    @State private var partyScore = 0;
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(self.countries[self.correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<4) { number in
                        Button {
                            self.flagTapped(number)
                        }   label: {
                            Image(self.countries[number])
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Score: \(self.score)/\(self.partyScore)")
                        .foregroundStyle(.secondary)
                        .font(.title.bold())
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }
            .padding()
        }
        .alert(self.scoreTitle, isPresented: self.$showingScore) {
            Button("Continue", action: askQuestion)
        } message : {
            Text("Your score is \(self.score)")
        }
        .alert("Finish!", isPresented: self.$endingGame) {
            Button("Restart", action: reset)
        } message : {
            Text("Your final score is \(self.score) good answers for \(self.partyScore) !")
                .font(.title2.weight(.semibold))
                .foregroundColor(.green)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == self.correctAnswer {
            self.scoreTitle = "Correct"
            self.score += 1
        } else {
            self.scoreTitle = "Wrong, it was the flag of  \(self.countries[number])"
        }
        
        self.partyScore += 1
        self.showingScore = true
        
        if self.partyScore == 8 {
            self.endingGame = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        self.correctAnswer = Int.random(in: 0...3)
    }
    
    func reset() {
        self.score = 0
        self.partyScore = 0
        askQuestion()
    }
}

#Preview {
    Game(countries: easy)
}
