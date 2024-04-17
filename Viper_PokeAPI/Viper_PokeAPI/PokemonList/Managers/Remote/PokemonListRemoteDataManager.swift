//
//  PokemonListRemoteDataManager.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation

class PokemonListRemoteDataManager:PokemonListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: PokemonListRemoteDataManagerOutputProtocol?
    let baseURL = "https://pokeapi.co/api/v2/pokemon"
    var pokemon: PokemonCharacteristics?
    var retrievedPokemons = [ApiPokemonResponse]()
    
    func fetchPokemons(completed: @escaping (Result<Void, PLError>) -> Void) {
        let endpoint = "\(baseURL)?limit=100"
                
                guard let url = URL(string: endpoint) else {
                    completed(.failure(.invalidRequest))
                    return
                }
                
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let _ = error {
                        completed(.failure(.unableToComplete))
                        return
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
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let pokemons = try decoder.decode(ApiPokemonResponse.self, from: data)
                        self.retrievedPokemons.append(pokemons)
                        self.remoteRequestHandler?.retrieveRemotePokemons(with: self.retrievedPokemons)
                        completed(.success(()))
                        
                    } catch {
                        completed(.failure(.invalidData))
                    }
                }
                
                task.resume()
    }
}
