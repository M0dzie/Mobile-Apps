//
//  ContentView.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    HStack {
                        Text(user.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: user.isActive ? "checkmark.seal.fill" : "xmark.seal.fill")
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationTitle("List of Users")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        guard users.isEmpty else { return }
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
                
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedData = try? decoder.decode([User].self, from: data) {
                for user in decodedData {
                    modelContext.insert(user)
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}

//#Preview {
//    ContentView()
//}
