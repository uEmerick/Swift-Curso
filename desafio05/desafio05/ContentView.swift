//
//  ContentView.swift
//  desafio05
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                NavigationLink(destination: Modulo01()) {
                    Text("Modulo 1")
                        .frame(width: 200, height: 100)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .background(.pink)
                        .cornerRadius(10)
                        
                }
                NavigationLink(destination: Modulo02()) {
                    Text("Modulo 2")
                        .frame(width: 200, height: 100)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .background(.pink)
                        .cornerRadius(10)
                        
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
