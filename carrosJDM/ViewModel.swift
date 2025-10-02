import Foundation

class ViewModel: ObservableObject {
    
    @Published var carros: [Carro] = []
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/leituraCaio") else {
            print("URL inválida.")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    print("Erro na requisição: \(error.localizedDescription)")
                } else {
                    print("Nenhum dado recebido.")
                }
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Carro].self, from: data)
                DispatchQueue.main.async {
                    self?.carros = parsed
                }
            } catch {
                print("Erro ao decodificar JSON: \(error.localizedDescription)")
                // debug print:
                // if let jsonString = String(data: data, encoding: .utf8) {
                //     print("JSON recebido: \(jsonString)")
                // }
            }
        }
        
        task.resume()
    }
}
