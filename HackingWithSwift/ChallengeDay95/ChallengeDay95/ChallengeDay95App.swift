//
//  ChallengeDay95App.swift
//  ChallengeDay95
//
//  Created by Thomas Meyer on 25/08/2024.
//

import SwiftData
import SwiftUI

@main
struct ChallengeDay95App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PreviousDice.self)
    }
}
