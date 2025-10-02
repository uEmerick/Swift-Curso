//
//  ContentView.swift
//  Aula01D2
//
//  Created by Turma02-4 on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image("HACKATRUCK_22022024-2-scaled")
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding()
                VStack {
                    Text("HackaTruck")
                        .foregroundStyle(.red)
                    Text("77 Universidades")
                        .foregroundStyle(.blue)
                    Text("5 Regiões do Brasil")
                        .foregroundStyle(.orange)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
