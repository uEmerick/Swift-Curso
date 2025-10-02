//
//  ContentView.swift
//  Aula01Desafio
//
//  Created by Turma02-4 on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = "Caio"
    @State private var showingAlert = false
    var body: some View {
        VStack {
            Text("Bem vindo \(name)! ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            TextField("Digite seu nome", text: $name)
                .frame(width: 50, height: 50, alignment: .center)
              
            
            Spacer()
            
            Image("HACKATRUCK_22022024-2-scaled")
                .frame(width: 100, height: 100, alignment: .center)
                .opacity(0.5)
            
            Image("dff3k6f-8114ff21-0a03-48b2-9aa8-bb604bbcd1cf")
                .resizable()
                .scaledToFit()
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            Spacer()
    
            Button("Entrar") {
                showingAlert = true
            }
            .alert("ALERTA!", isPresented: $showingAlert){
                Button("Vamos lá"){}
            }message: {
                Text("Você irá iniciar o desafio de aula agora")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
