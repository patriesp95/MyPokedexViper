//
//  PokemonListInteractor.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation

class PokemonListInteractor: PokemonListInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: PokemonListInteractorOutputProtocol?
    var localDatamanager: PokemonListLocalDataManagerInputProtocol?
    var remoteDatamanager: PokemonListRemoteDataManagerInputProtocol?
    
    var pokemons = [Pokemon]()
    
    func getPokemons() {
        remoteDatamanager?.fetchPokemons(completed: { result in
            switch result {
                case .success():
                    break
                case .failure(let error):
                    print("an error ocurred:  \(error)")
            }
        })
    }
}

extension PokemonListInteractor: PokemonListRemoteDataManagerOutputProtocol {
    func retrieveRemotePokemons(with pokemons: [ApiPokemonResponse]) {
        //interactor send back data to the presenter
        //print("retrieving remote data(pokemons).. \(pokemons)")
        
        for items in pokemons[0].results {
            let name = items.name
            let url = items.url
            self.pokemons.append(Pokemon(name: name, url: url))
        }
        
        //print("sending back data(pokemons) to presenter.. \(self.pokemons)")
        presenter?.getData(with: self.pokemons)
    }
}
