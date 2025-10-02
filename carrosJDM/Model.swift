import Foundation

struct Carro: Decodable, Hashable {
    let _id: String
    let modelo: String
    let ano: Int
    let motor: String
    let preco: Double
    let foto: String
    let km: Int
    let cores: [String]
    let combustivel: String
    let potencia: String
    let tracao: String
}


