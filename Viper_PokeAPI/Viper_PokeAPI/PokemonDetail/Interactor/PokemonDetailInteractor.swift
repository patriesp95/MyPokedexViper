//
//  PokemonDetailInteractor.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation

class PokemonDetailInteractor: PokemonDetailInteractorInputProtocol {
   
    // MARK: Properties
    weak var presenter: PokemonDetailInteractorOutputProtocol?
    var localDatamanager: PokemonDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: PokemonDetailRemoteDataManagerInputProtocol?
    var retrievedPokemon: PokemonCharacteristics?
        
    func getPokemonByName(with name: String) {
        remoteDatamanager?.fetchPokemonByName(name: name, completed: { result in
            switch result {
                case .success():
                    break
                case .failure(let error):
                    print("an error ocurred:  \(error)")
            }
        })
    }
}

extension PokemonDetailInteractor: PokemonDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func retrieveRemotePokemon(with pokemon: PokemonCharacteristics) {
        //interactor send back data to the presenter
        //print("sending this pokemon back to presenter.. \(pokemon)")
        presenter?.getData(with: pokemon)
    }
}
