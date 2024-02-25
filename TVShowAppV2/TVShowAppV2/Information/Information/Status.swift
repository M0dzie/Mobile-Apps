//
//  Status.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Status: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Status : ")

            if let status = self.show.status {
                TextUpgrade(text: status, italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}