//
//  ApiPokemonResponse.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct ApiPokemonResponse: Decodable {
    var count: Int
    var next: String
    var previous: String?
    var results: [Pokemon]
}
