import SwiftUI
import PDFKit

struct ContentView: View {
    @StateObject private var pdfManager = PDFManager()
    
    let grupos = ["Swift", "Arduino IDE", "Palestras"]
    @State private var mostrarPicker = false

    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Spacer()
                }
                .padding(.bottom, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(grupos, id: \.self) { grupo in
                            Button(action: {
                                pdfManager.grupoSelecionado = grupo
                            }) {
                                Text(grupo)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(pdfManager.grupoSelecionado == grupo ? Color.pink.opacity(0.9) : Color.gray.opacity(0.1))
                                    .foregroundColor(pdfManager.grupoSelecionado == grupo ? Color.white : Color.black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                ZStack {
                    ScrollView {
                            VStack {
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(pdfManager.materiaisFiltrados) { material in
                                        HStack {
                                            if let link = material.link, let url = URL(string: link) {
                                                NavigationLink(destination: PDFKitView(url: url)) {
                                                    Text(material.nome ?? "Sem nome")
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            if let link = material.link, let nome = material.nome {
                                                Button {
                                                    pdfManager.downloadPDF(from: link, nome: nome)
                                                } label: {
                                                    Image(systemName: "arrow.down.circle")
                                                        .font(.title2)
                                                }
                                            }
                                            
                                            Button {
                                                pdfManager.deletarMaterial(material)
                                            } label: {
                                                Image(systemName: "trash")
                                                    .foregroundColor(.red)
                                                    .font(.title2)
                                            }
                                        }
                                        .padding()
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                    }
                                }
                                .padding(.top)
                            }
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            mostrarPicker = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .padding()
                                .background(Color.pink)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .sheet(isPresented: $mostrarPicker) {
                            DocumentPicker { url in
                                pdfManager.adicionarMaterialComArquivo(url: url)
                            }
                        }
                    }
                    .padding(.top, 375)
                }
                
                
                TabView {
                    VStack() {
                        Image(systemName: "folder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.red)
                        Text("Arquivos")
                            .font(.callout)
                    }
                    .tabItem {
                        Label("Arquivos", systemImage: "folder")
                    }
                    
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.orange)
                        Text("Registro de presença")
                            .font(.title2)
                    }
                    .tabItem {
                        Label("Presença", systemImage: "checkmark.circle")
                    }
                    
                    VStack(spacing: 20) {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.green)
                        Text("Calendário do evento")
                            .font(.title2)
                    }
                    .tabItem {
                        Label("Calendário", systemImage: "calendar")
                    }
                    
                    VStack(spacing: 20) {
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.blue)
                        Text("Configurações do app")
                            .font(.title2)
                    }
                    .tabItem {
                        Label("Configurações", systemImage: "gear")
                    }
                }
            }
            .padding()
        }
        .onAppear {
            pdfManager.fetchEvento()
        }
    }
}


struct PDFKitView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true

        if let document = PDFDocument(url: url) {
            pdfView.document = document
        }

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // Nada a atualizar por enquanto
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

