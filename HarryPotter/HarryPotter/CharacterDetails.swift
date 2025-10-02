// CharacterDetails.swift
import SwiftUI

struct CharacterDetails: View {
    let receivedCharacter: HaPo // Recebe um único objeto HaPo para exibir os detalhes
    
    var body: some View {
        VStack {
            // Imagem grande do personagem
            if let imageUrlString = receivedCharacter.image,
               let imageUrl = URL(string: imageUrlString),
               !imageUrlString.isEmpty {
                
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .shadow(radius: 7)
                } placeholder: {
                    ProgressView() // Indicador de carregamento
                }
            } else {
                // Imagem padrão se não houver URL ou for inválida
                Image("default") // Certifique-se de ter esta imagem em seus Assets.xcassets
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 7)
            }
            
            // Detalhes do personagem
            Text(receivedCharacter.name ?? "Nome Indisponível")
                .font(.largeTitle)
                .padding(.bottom, 5)
            
            Text("House: \(receivedCharacter.house ?? "Desconhecida")")
                .font(.title2)
                .padding(.bottom, 2)
            
            Text("Species: \(receivedCharacter.species ?? "Desconhecida")")
                .font(.title3)
                .padding(.bottom, 2)
            
            Text("Gender: \(receivedCharacter.gender ?? "Desconhecido")")
                .font(.title3)
                .padding(.bottom, 2)
            
            Text("Ancestry: \(receivedCharacter.ancestry ?? "Desconhecida")")
                .font(.title3)
                .padding(.bottom, 2)
            
            Text("Date of Birth: \(receivedCharacter.dateOfBirth ?? "Desconhecido")")
                .font(.title3)
                .padding(.bottom, 2)
            
            Spacer() // Empurra o conteúdo para o topo da tela
        }
        .navigationTitle(receivedCharacter.name ?? "Detalhes") // Título da barra de navegação
    }
}
