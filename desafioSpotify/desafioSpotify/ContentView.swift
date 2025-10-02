//
//  ContentView.swift
//  desafioSpotify
//
//  Created by Turma02-4 on 07/07/25.
//

import SwiftUI

struct Song : Identifiable {
    var id : Int
    var  name : String
    var artist : String
    var capa : String
}

struct ContentView: View {
    
    var arrayMusicas = [
        Song(id: 1, name: "All The Small Things", artist: "Blink-182", capa: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhmDnzCc83De-ER2-oQIm9Jfm7KFnRujqGFBnDD55kPMtO1sKaZgPpVW-7K347-ewgI_5KIQj0f12VOMJVNmrioWFoNvWXQX5x0j3caD5VIzi5xcSqBpOWfqVGlKjCNi46_BzUazPAWxaFqjZzxPG7Rs3IFyHqEerq58msreZJ6DwEfDrrYWpDyTsfJ5FWG/s1000/-.jpg"),
        Song(id: 2, name: "Black Hole Sun", artist: "Soundgarden", capa: "https://www.tenhomaisdiscosqueamigos.com/wp-content/uploads/2019/04/Superunknown-Soundgarden-Chris-Cornell-1-300x300.jpg"),
        Song(id: 3, name: "Creep", artist: "Radiohead", capa: "https://cdn-images.dzcdn.net/images/cover/1dd56fd8824492e1a5106c99a00a85ec/1900x1900-000000-80-0-0.jpg"),
        Song(id: 4, name: "Don't Look Back in Anger", artist: "Oasis", capa: "https://cdn-images.dzcdn.net/images/cover/d63b6ce2589b96cee3e6aa85d996023a/1900x1900-000000-80-0-0.jpg"),
        Song(id: 5, name: "Everlong", artist: "Foo Fighters", capa: "https://cdn-images.dzcdn.net/images/cover/780023e1177b5ea38fcbd557cf57cc8a/1900x1900-000000-80-0-0.jpg")]

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                        Image("truck")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(.rect)
                        .padding(.vertical,50)
                    HStack {
                        Text("HackaFM")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding(.horizontal,1)
                        Spacer()
                    }
                    HStack {
                        Image("truck")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(.rect)
                        .padding(.horizontal,1)
                        Text("HackSong")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        Spacer()
                            
                    }
                    .padding(.vertical, 15)
                    
                    ScrollView {
                        ForEach(arrayMusicas) {song in
                            HStack {
                                AsyncImage(url: URL(string: song.capa)) { image in
                                    image.resizable()
                                         .frame(width: 45, height: 45)
                                } placeholder: {
                                    ProgressView()
                                }
                                NavigationLink(destination: SegundaTela(receivedSong: song)){
                                        VStack {
                                            Text(song.name)
                                                .foregroundStyle(.white)
                                                .font(.callout)
                                            Text(song.artist)
                                                .foregroundStyle(.white)
                                                .font(.caption)
                                        }
                                    }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                            }
                        }
                        HStack {
                            Text("Sugeridos")
                                .foregroundStyle(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                            Spacer()
                        }
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Image("linkin park")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Text("Numb")
                                        .foregroundStyle(.white)
                                    
                                }
                                VStack {
                                    Image("deftones")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Text("Change")
                                        .foregroundStyle(.white)
                                    
                                }
                                VStack {
                                    Image("system")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Text("Toxicity")
                                        .foregroundStyle(.white)
                                    
                                }
                                VStack {
                                    Image("nirvana")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Text("Stay Way")
                                        .foregroundStyle(.white)
                                    
                                }

                            }
                        }
                    }
                                        
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
