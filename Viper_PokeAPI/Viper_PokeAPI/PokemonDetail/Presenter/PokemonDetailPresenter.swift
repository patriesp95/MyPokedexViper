//
//  PokemonDetailPresenter.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation

class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    
    // MARK: Properties
    weak var view: PokemonDetailViewProtocol?
    var interactor: PokemonDetailInteractorInputProtocol?
    var router: PokemonDetailRouterProtocol?
    
    var name: String?
    
    func viewDidLoad() {
        if let name = self.name {
            interactor?.getPokemonByName(with: name)
        }
    }
    
}

extension PokemonDetailPresenter: PokemonDetailInteractorOutputProtocol {
    func getData(with: PokemonCharacteristics) {
        view?.showPokemon(with: with)
    }
}
