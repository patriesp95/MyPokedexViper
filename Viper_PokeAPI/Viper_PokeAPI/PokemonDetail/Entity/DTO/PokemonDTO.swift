//
//  PokemonDTO.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct PokemonDTO: Decodable {
    var abilities: [PokemonAbility]
    var base_experience: Int
    var forms: [PokemonForm]
    var game_indices: [PokemonIndex]
    var height: Int
    var held_items: [PokemonItem]
    var id: Int
    var is_default: Bool
    var location_area_encounters: String
    var moves: [PokemonMove]
    var name: String
    var order: Int
    var past_types: [PokemonPastType]
    var species: PokemonSpecie
    var sprites: PokemonSprite
    var stats: [PokemonStat]
    var types: [PokemonType]
    var weight: Int
}
