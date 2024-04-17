//
//  PokemonDetailProtocols.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation
import UIKit

protocol PokemonDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: PokemonDetailPresenterProtocol? { get set }
    
    func showPokemon(with: PokemonCharacteristics)
    
}

protocol PokemonDetailRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createPokemonDetailModule(with: String) -> UIViewController
}

protocol PokemonDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: PokemonDetailViewProtocol? { get set }
    var interactor: PokemonDetailInteractorInputProtocol? { get set }
    var router: PokemonDetailRouterProtocol? { get set }
    var name: String? { get set }
    func viewDidLoad()
}

protocol PokemonDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func getData(with: PokemonCharacteristics)
}

protocol PokemonDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: PokemonDetailInteractorOutputProtocol? { get set }
    var localDatamanager: PokemonDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PokemonDetailRemoteDataManagerInputProtocol? { get set }
    var retrievedPokemon: PokemonCharacteristics? { get set }
    
    func getPokemonByName(with name: String)
}

protocol PokemonDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol PokemonDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PokemonDetailRemoteDataManagerOutputProtocol? { get set }
    
    func fetchPokemonByName(name: String, completed: @escaping (Result<Void,PLError>) -> Void)

}

protocol PokemonDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func retrieveRemotePokemon(with pokemon: PokemonCharacteristics)
}

protocol PokemonDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
