//
//  PokemonType.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct PokemonType: Decodable {
    var type: PokeType
}
struct PokeType: Codable {
    var name: String
    var url: String
}
