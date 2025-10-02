//
//  Modulo02.swift
//  desafio05
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Modulo02: View {
    @State  var name: String = ""
    @State  var rename: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                    .edgesIgnoringSafeArea(.top)
                VStack {
                    Spacer()
                    HStack {
                        VStack {
                            TextField("Digite o nome", text: $name)
                                .frame(width: 90)
                                .foregroundColor(.white)

                                Text("Bem-Vindo, \(name)")
                                .foregroundColor(.white)
                                .padding()
                            
                            NavigationLink(destination: Modulo0202(receivedName: name)) {
                                Text("Acessar Tela")
                                    .font(.title3) // 1. Aumente o tamanho da fonte
                                    .fontWeight(.bold) // 2. Deixe o texto em negrito (opcional)
                                    .padding(.vertical, 10) // 3. Adicione mais padding vertical
                                    .padding(.horizontal, 25) // 4. Adicione mais padding horizontal
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)

                                
                                    
                                }

                        }
                    }.padding(.horizontal, 60)
                        .padding(.vertical, 40)
                        .background(.pink)
                        .cornerRadius(10)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Modulo02()
}
