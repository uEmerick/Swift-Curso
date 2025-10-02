//
//  Model.swift
//  HarryPotter
//
//  Created by Turma02-4 on 14/07/25.
//

import Foundation

struct HaPo: Decodable, Identifiable {
    let id: String
    let name: String?
    let alternate_names: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let image: String?
}
