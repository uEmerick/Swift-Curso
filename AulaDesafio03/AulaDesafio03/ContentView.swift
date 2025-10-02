//
//  ContentView.swift
//  AulaDesafio03
//
//  Created by Turma02-4 on 03/07/25.
//

import SwiftUI


struct ContentView: View {
    @State private var showingAlert = false
    @State private var km = 0.0
    @State private var h = 0.0
    @State private var result = 0.0
    @State private var color = Color.gray
    @State private var img = Image("ponto 1")
    
    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)
            VStack {
    //            Image(systemName: "globe")
    //                .imageScale(.large)
    //                .foregroundStyle(.tint)
                
                Text("Digite a distância (Km):")
                TextField("0", value: $km, format: .number)
                    .multilineTextAlignment(.center)
                
                Text("Digite o tempo (h):")
                TextField("0", value: $h, format: .number)
                    .multilineTextAlignment(.center)
                
                Button("Calcular"){
                    result = km/h
                    
                    if result >= 0 && result <= 9.9 {
                        color = Color.verdeClaro
                        img = Image("turtle")
                    }
                    else if result >= 10 && result <= 29.9 {
                        color = Color.azulClaro
                        img = Image("elephant")
                    }
                    else if result >= 30 && result <= 69.9 {
                        color = Color.laranjaClaro
                        img = Image("avestruz")
                    }
                    else if result >= 70 && result <= 89.9 {
                        color = Color.amareloClaro
                        img = Image("lion")
                    }
                    else if result >= 90 && result <= 130 {
                        color = Color.vermelhoClaro
                        img = Image("guepard")
                    }
                }
                .frame(width: 75, height: 45)
                .foregroundColor(.orange)
                .background(.black)
                .cornerRadius(10)
                .padding()
                //.controlSize(.large)
                
                Text("\(result) Km/h")
                    .font(.title)
                //receber resultado da divisao
                Spacer()
                img
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: 255, height: 140)
                        .cornerRadius(10)
                    VStack {
                        HStack {
                            VStack {
                                Text("TARTARUGA")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Text("(0 - 9.9km/h)").foregroundColor(.white)
                            }
                            VStack {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.verdeClaro)
                            }
                        }
                        HStack {
                            VStack {
                                Text("ELEFANTE")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Text("(10 - 29.9km/h)").foregroundColor(.white)
                            }
                            VStack {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.azulClaro)
                            }
                        }
                        HStack {
                            VStack {
                                Text("AVESTRUZ")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Text("(30 - 69.9km/h)").foregroundColor(.white)
                            }
                            VStack {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.laranjaClaro)
                            }
                        }
                        HStack {
                            VStack {
                                Text("LEÃO")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Text("(70 - 89.9km/h)").foregroundColor(.white)
                            }
                            VStack {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.amareloClaro)
                            }
                        }
                        HStack {
                            VStack {
                                Text("GUEPARDO")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Text("(90 - 130km/h)").foregroundColor(.white)
                        
                            }
                            VStack {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.vermelhoClaro)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
