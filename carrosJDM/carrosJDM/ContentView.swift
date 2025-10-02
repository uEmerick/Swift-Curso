import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        ForEach(viewModel.carros, id: \.self) { carro in
                            NavigationLink(destination: SegundaTela(receivedCarro: carro)){
                                HStack {
                                    AsyncImage(url: URL(string: carro.foto)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 50, height: 50)
                                    }
                                    Text(carro.modelo)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(10)
                                .padding(.horizontal, 5)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
