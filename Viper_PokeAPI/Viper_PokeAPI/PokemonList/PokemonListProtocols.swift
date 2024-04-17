//
//  PokemonListProtocols.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation
import UIKit

protocol PokemonListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: PokemonListPresenterProtocol? { get set }
    var pokemons: [String] { get set }
    
    func showPokemons(with pokemons: [Pokemon])
    func showActivity()
    func hideActivity()
}

protocol PokemonListRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createPokemonListModule() -> UIViewController
    func presentView(from view: PokemonListViewProtocol, with: String)
}

protocol PokemonListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: PokemonListViewProtocol? { get set }
    var interactor: PokemonListInteractorInputProtocol? { get set }
    var router: PokemonListRouterProtocol? { get set }
    var pokemons: [ApiPokemonResponse] { get set }
    
    func viewDidLoad()
    func showDetail(with name: String)
}

protocol PokemonListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func getData(with pokemons: [Pokemon])
}

protocol PokemonListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: PokemonListInteractorOutputProtocol? { get set }
    var localDatamanager: PokemonListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PokemonListRemoteDataManagerInputProtocol? { get set }
    
    func getPokemons()
}

protocol PokemonListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol PokemonListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PokemonListRemoteDataManagerOutputProtocol? { get set }
    
    func fetchPokemons(completed: @escaping (Result<Void, PLError>) -> Void)
}

protocol PokemonListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR    
    func retrieveRemotePokemons(with pokemons: [ApiPokemonResponse])
}

protocol PokemonListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
