// ViewModel.swift
import Foundation

class ViewModel: ObservableObject {
    
    @Published var personagens: [HaPo] = [] // Array de personagens do tipo HaPo
    
    func fetch() {
        // URL para buscar apenas os personagens da Grifinória
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            print("URL inválida.") // Mensagem de erro se a URL for inválida
            return
        }
        
        // Inicia a tarefa de rede
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Verifica se há dados e nenhum erro
            guard let data = data, error == nil else {
                if let error = error {
                    print("Erro na requisição: \(error.localizedDescription)")
                } else {
                    print("Nenhum dado recebido.")
                }
                return
            }
            
            do {
                // Tenta decodificar o JSON para um array de HaPo
                let parsed = try JSONDecoder().decode([HaPo].self, from: data)
                
                // Atualiza a propriedade @Published na thread principal
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            } catch {
                // Captura e imprime erros de decodificação
                print("Erro ao decodificar JSON: \(error.localizedDescription)")
                // Para depurar, você pode imprimir o JSON bruto:
                // if let jsonString = String(data: data, encoding: .utf8) {
                //     print("JSON recebido: \(jsonString)")
                // }
            }
        }
        
        task.resume() // Inicia a tarefa de rede
    }
}u
