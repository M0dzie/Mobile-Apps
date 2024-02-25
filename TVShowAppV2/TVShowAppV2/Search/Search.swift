//
//  Search.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Search: View {
    @State private var started = true
    @State private var isLoading = false
    @State private var searchTerm = String()
    @State private var shows: [Show] = []

    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(.sRGB, red: 230/255, green: 242/255, blue: 255/255, opacity: 1.0))
                .frame(height: 36)
                .padding()
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
                    .padding(.leading, 20)
                
                TextField("Nom de Série...", text: self.$searchTerm)
                    .foregroundColor(.black)
                    .padding(5)
                    .onChange(of: self.searchTerm) {
                        showResult()
                    }
            }
            .padding()
        }
    }
    
    func showResult() {
        self.started = false
        
        TVMazeAPI.shared.searchShows(query: self.searchTerm) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let shows):
                    self.shows = shows
                case .failure(let error):
                    print("Error fetching shows: \(error)")
                }
            }
        }
    }
}
