// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel() // Instância do ViewModel para gerenciar o estado
    
    var body: some View {
        NavigationStack { // Para gerenciar a navegação entre telas
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all) // Fundo vermelho para toda a tela
                
                VStack {
                    // Logo da Grifinória
                    Image("grifnoria") // Certifique-se de ter esta imagem em seus Assets.xcassets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.top, 100)
                        .padding(.bottom, 50)
                    
                    // Lista de personagens em um ScrollView
                    ScrollView {
                        ForEach(viewModel.personagens) { character in
                            // Cada item da lista é um NavigationLink para CharacterDetails
                            NavigationLink(destination: CharacterDetails(receivedCharacter: character)) {
                                HStack {
                                    // Imagem do personagem na lista (pequena e circular)
                                    if let imageUrlString = character.image,
                                       let imageUrl = URL(string: imageUrlString),
                                       !imageUrlString.isEmpty {
                                        AsyncImage(url: imageUrl) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                        } placeholder: {
                                            ProgressView() // Exibe um ProgressView enquanto a imagem carrega
                                                .frame(width: 50, height: 50)
                                        }
                                    } else {
                                        // Imagem padrão se o personagem não tiver uma imagem
                                        Image("default") // Certifique-se de ter esta imagem em seus Assets.xcassets
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    }
                                    
                                    // Nome do personagem
                                    Text(character.name ?? "Personagem Desconhecido")
                                        .font(.title2)
                                        .foregroundColor(.white) // Texto branco para visibilidade no fundo vermelho
                                    Spacer() // Empurra o texto para a esquerda e cria espaço
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.black.opacity(0.3)) // Fundo semitransparente para o item
                                .cornerRadius(10)
                                .padding(.horizontal, 5) // Espaçamento entre os itens da lista
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetch() // Chama a função para carregar os dados quando a view aparece
        }
    }
}

#Preview {
    ContentView()
}
