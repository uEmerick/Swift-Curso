//
//  SegundaTela.swift
//  carrosJDM
//
//  Created by Turma02-4 on 17/07/25.
//

import SwiftUI

struct SegundaTela: View {
    let receivedCarro: Carro
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                AsyncImage(url: URL(string: receivedCarro.foto)) { image in
                    image.resizable()
                        .scaledToFit() // Ajusta a imagem para caber sem cortar
                        .frame(width: 300, height: 300) // Define um tamanho fixo para a capa
                        .cornerRadius(15) // Adiciona um leve arredondamento nas bordas da capa
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 300, height: 300)
                        .background(Color.gray.opacity(0.3)) // Fundo para o placeholder
                        .cornerRadius(15)
                }
                .padding(.bottom, 25)
                
                HStack {
                    Text("Modelo: \(receivedCarro.modelo)")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal, 50)
                    Text("Ano: \(receivedCarro.ano)")
                        .foregroundStyle(.white)
                        .bold()
                }
                .padding(.bottom , 5)
                
                
                HStack {
                    Text("Motor: \(receivedCarro.motor)")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal, 50)
                    
                    Text("Km: \(receivedCarro.km)")
                        .foregroundStyle(.white)
                        .bold()
                }
                
                HStack {
                    Text("Combustivel: \(receivedCarro.combustivel)")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal, 50)
                    
                    Text("Preço: \(receivedCarro.preco)")
                        .foregroundStyle(.white)
                        .bold()
                }
                
                HStack {
                    Text("Cores: \(receivedCarro.cores)")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal, 50)
                    
                    Text("Tração: \(receivedCarro.tracao)")
                        .foregroundStyle(.white)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    // Para o preview, você precisa criar uma instância real da struct
    let exemplo = Carro(
        _id: "000",
        modelo: "Modelo",
        ano: 0000,
        motor: "Motor",
        preco: 0.0,
        foto: "https://via.placeholder.com/250",
        km: 0,
        cores: ["Azul", "Vermelho"],
        combustivel: "Combustivel",
        potencia: "Potencia",
        tracao: "Tração"
    )
    return SegundaTela(receivedCarro: exemplo)
}
