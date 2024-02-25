//
//  Search.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Search: View {
    @State private var searchTerm = String()
    @State private var shows: [Show] = []

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    ZStack {
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
                    
                    Spacer()
                    
                    if shows.isEmpty {
                        NoMatch()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(shows) { show in
                                NavigationLink(destination: Information(show: show)) {
                                    if let imageURLString = show.image?.medium {
                                        AsyncImage(url: URL(string: imageURLString)) { image in
                                            VStack {
                                                Text(show.name)
                                                    .foregroundColor(.blue)
                                                    .font(.title2.italic())
                                                
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                    .padding()
                                            }
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    func showResult() {
        TVMazeAPI.shared.searchShows(query: self.searchTerm) { result in
            DispatchQueue.main.async {
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

#Preview {
    Search()
}
