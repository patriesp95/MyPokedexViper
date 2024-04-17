//
//  PokemonDetailRemoteDataManager.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation

class PokemonDetailRemoteDataManager:PokemonDetailRemoteDataManagerInputProtocol {
    var remoteRequestHandler: PokemonDetailRemoteDataManagerOutputProtocol?
    
    var pokemon: PokemonCharacteristics?
    
    func fetchPokemonByName(name: String, completed: @escaping (Result<Void, PLError>) -> Void) {
        
        let baseURL = "https://pokeapi.co/api/v2/pokemon"
        let endpoint = "\(baseURL)/\(name)"
                
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response  as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
                        
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.pokemon = try decoder.decode(PokemonCharacteristics.self, from: data)
                completed(.success(()))
                if let myPokemon = self.pokemon {
                    self.remoteRequestHandler?.retrieveRemotePokemon(with: myPokemon)
                }
            } catch {
                completed(.failure(.invalidData))

            }
        }
                
        task.resume()
    }
    
}
