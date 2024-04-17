//
//  GenerationII.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct GenerationII: Decodable {
    var crystal: Crystal
    var gold: Gold
    var silver: Silver
}

struct Crystal: Decodable {
    var back_default: URL
    var back_shiny: URL
    var back_shiny_transparent: URL
    var back_transparent: URL
    var front_default: URL
    var front_shiny: URL
    var front_shiny_transparent: URL
    var front_transparent: URL
}
struct Gold: Decodable {
    var back_default: URL
    var back_shiny: URL
    var front_default: URL
    var front_shiny: URL
    var front_transparent: URL
}
struct Silver: Decodable {
    var back_default: URL
    var back_shiny: URL
    var front_default: URL
    var front_shiny: URL
    var front_transparent: URL
}
