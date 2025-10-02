//
//  ContentView.swift
//  desafio04
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.white
    var body: some View {
        ZStack {
            color                .edgesIgnoringSafeArea(.top)
            
            TabView {
                    
                    Rosa()
                        .tabItem {
                            Label("Rosa", systemImage: "paintbrush.fill")
                        }
                    Azul()
                    .tabItem {
                        Label("Azul", systemImage: "paintbrush.pointed.fillb")
                    }
                    Cinza()
                    .tabItem {
                        Label("Cinza", systemImage: "paintpalette.fill")
                    }
                Lista()
                    .tabItem {
                        Label("Lista", systemImage: "list.bullet")
                    }
                }
            }
        }
    }
#Preview {
    ContentView()
}

