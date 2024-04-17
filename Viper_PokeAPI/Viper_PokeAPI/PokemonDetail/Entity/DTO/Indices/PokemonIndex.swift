//
//  PokemonIndex.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct PokemonIndex: Decodable {
    var game_index: Int
    var version: Version
}

struct Version: Decodable {
    var name: String
    var url: String
}
