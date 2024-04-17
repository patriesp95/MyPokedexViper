//
//  PokemonListPresenter.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation

class PokemonListPresenter: PokemonListPresenterProtocol {
    
    // MARK: Properties
    weak var view: PokemonListViewProtocol?
    var interactor: PokemonListInteractorInputProtocol?
    var router: PokemonListRouterProtocol?
    
    var pokemons = [ApiPokemonResponse]()

    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getPokemons()
        view?.showActivity()
    }
    
    func showDetail(with name: String) {
        router?.presentView(from: view!, with: name)
    }
}

extension PokemonListPresenter: PokemonListInteractorOutputProtocol {
    func getData(with pokemons: [Pokemon]) {
        view?.hideActivity()
        view?.showPokemons(with: pokemons)
    }
}
