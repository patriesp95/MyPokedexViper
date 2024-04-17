//
//  PokemonStat.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//

import Foundation

struct PokemonStat {
    var baseStat: Int
    var effort: Int
    var stat: Stat
}

struct Stat: Decodable {
    var name: String
    var url: String
}

extension PokemonStat: Decodable {
    enum PokemonStatCodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PokemonStatCodingKeys.self)
        baseStat = try values.decode(Int.self, forKey: .baseStat)
        effort = try values.decode(Int.self, forKey: .effort)
        stat = try values.decode(Stat.self, forKey: .stat)
    }

}
