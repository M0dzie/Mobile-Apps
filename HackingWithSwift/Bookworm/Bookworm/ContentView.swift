//
//  ContentView.swift
//  Bookworm
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftUI
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

struct ContentView: View {

    var body: some View {
        Text("Hello")
    }
}

#Preview {
    ContentView()
}
