//
//  ContentView.swift
//  WordScramble
//
//  Created by Thomas Meyer on 01/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = String()
    @State private var newWord = String()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        Text(word)
                    }
                }
            }
        }
        .navigationTitle(rootWord)
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        usedWords.insert(answer, at: 0)
        newWord = String()
    }
}

#Preview {
    ContentView()
}
