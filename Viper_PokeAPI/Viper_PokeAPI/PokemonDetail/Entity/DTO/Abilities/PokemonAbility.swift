//
//  PokemonAbility.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct PokemonAbility: Decodable {
    var ability: Ability
}

struct Ability: Decodable {
    var name: String
    var url: String
}
