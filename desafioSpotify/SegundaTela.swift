//
//  SegundaTela.swift
//  desafioSpotify
//
//  Created by Turma02-4 on 07/07/25.
//

import SwiftUI



struct SegundaTela: View {
    let receivedSong : Song

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer() // Empurra o conteúdo para o centro/topo

                AsyncImage(url: URL(string: receivedSong.capa)) { image in
                    image.resizable()
                        .scaledToFit() // Ajusta a imagem para caber sem cortar
                        .frame(width: 250, height: 250) // Define um tamanho fixo para a capa
                        .cornerRadius(15) // Adiciona um leve arredondamento nas bordas da capa
                        .shadow(radius: 10) // Adiciona uma sombra para destaque
                } placeholder: {
                    ProgressView() // Exibe um indicador de carregamento enquanto a imagem carrega
                        .frame(width: 250, height: 250)
                        .background(Color.gray.opacity(0.3)) // Fundo para o placeholder
                        .cornerRadius(15)
                }
                .padding(.bottom, 30) // Espaçamento abaixo da capa

                Text(receivedSong.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) // Centraliza o texto
                    .padding(.horizontal) // Adiciona padding horizontal

                Text(receivedSong.artist)
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center) // Centraliza o texto
                    .padding(.top, 5) // Espaçamento acima do nome do artista
                    .padding(.horizontal)

                Spacer()
                HStack {
                    Image(systemName: "shuffle")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    Image(systemName: "backward.end.fill")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .padding()
                    Image(systemName: "forward.end.fill")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    Image(systemName: "repeat")
                        .foregroundColor(.white)
                        .font(.title)
                }
                Spacer()
            }
        }
        // Configura o título da barra de navegação para a SegundaTela
        .navigationTitle(receivedSong.name)
        .navigationBarTitleDisplayMode(.inline) // Título menor na barra
    }
}

#Preview {
    // Para o preview, você precisa criar uma instância real da struct Song
    let exampleSong = Song(
        id: 99,
        name: "Exemplo de Música",
        artist: "Artista de Exemplo",
        capa: "https://via.placeholder.com/250" // URL de imagem de placeholder
    )
    return SegundaTela(receivedSong: exampleSong)
}
