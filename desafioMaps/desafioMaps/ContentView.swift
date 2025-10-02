//
//  ContentView.swift
//  desafioMaps
//
//  Created by Turma02-4 on 08/07/25.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {

    @State private var showingSheet = false
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    )

    @State private var arrayLocais = [
        Location(nome: "Cristo Redentor", foto: "https://diocesedecampos.org.br/wp-content/uploads/2020/08/cristo-Redentor.jpg", descricao: "O Cristo Redentor é uma estátua icônica de Jesus Cristo localizada no topo do morro do Corcovado, no Rio de Janeiro, Brasil. É um dos principais símbolos do cristianismo e um marco cultural do Brasil, conhecido mundialmente.", latitude: -22.951, longitude: -43.2104),
        Location(nome: "A Grande Muralha da China", foto: "https://s2-galileu.glbimg.com/LEabmUEdne_OYeaFvuYCnjAUICY=/0x0:800x532/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_fde5cd494fb04473a83fa5fd57ad4542/internal_photos/bs/2025/a/P/9StDT2QVy9CvGVsoVYWA/20090529-great-wall-8185.jpg", descricao: "Grande Muralha da China é uma série de fortificações feitas de pedra, tijolo, terra compactada, madeira e outros materiais, geralmente construída ao longo de uma linha leste-oeste através das fronteiras históricas do norte da China para proteger os Estados e impérios chineses contra as invasões dos vários grupos nômades das estepes da Eurásia, principalmente os mongóis. Várias muralhas estavam sendo construídas já no século VII a.C.", latitude: 40.3611, longitude: 116.0064),
        Location(nome: "Machu Picchu", foto: "https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/08/49598_FB709B6C2250A9FB-1.jpg?w=1200&h=675&crop=1", descricao: "Machu Picchu é uma cidadela inca que fica no alto da Cordilheira dos Andes no Peru, acima do vale do rio Urubamba. Construída no século XV e posteriormente abandonada, ela é conhecida pelas sofisticadas muralhas de pedra contínuas, cujos imensos blocos foram unidos sem o uso de argamassa, pelas construções intrigantes que levam em conta o alinhamento dos astros e pelas vistas panorâmicas. A antiga utilidade dessas construções segue sendo um mistério.", latitude: -13.163056, longitude: -72.546111)
    ]

    @State private var selectedLocation: Location?

    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $position) {
                ForEach(arrayLocais, id: \.self) { local in
                    Annotation(local.nome, coordinate: CLLocationCoordinate2D(latitude: local.latitude, longitude: local.longitude)) {
                        Button(action: {
                            showingSheet = true
                        }){
                            Image(systemName: "mappin")
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20)
                        }
                        .sheet(isPresented: $showingSheet) {
                            ZStack {
                                Color.yellow
                                VStack {
                                    AsyncImage(url: URL(string: local.foto)) {foto in
                                        foto
                                            .resizable()
                                            .frame(width: 250, height: 250)
                                            
                                        Text("\(local.nome)")
                                            .font(.title)
                                            .foregroundStyle(.brown)
                                            .bold()
                                        Text("\(local.descricao)")
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(.brown)
                                            .padding()
                                    } placeholder: {
                                        Color.gray
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()

            Picker("Selecione um Local", selection: $selectedLocation) {
                Text("Selecione um Local").tag(nil as Location?)
                ForEach(arrayLocais, id: \.self) { local in
                    Text(local.nome)
                        .tag(local as Location?)
                }
            }
            .pickerStyle(.menu)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.bottom, 20)
        }
        .onAppear {
            selectedLocation = arrayLocais.first
        }
        .onChange(of: selectedLocation) { oldLocation, newLocation in
            if let newLocation = newLocation {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: newLocation.latitude, longitude: newLocation.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                    )
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
