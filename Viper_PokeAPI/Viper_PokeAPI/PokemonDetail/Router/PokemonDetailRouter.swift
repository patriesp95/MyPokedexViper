//
//  PokemonDetailWireFrame.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation
import UIKit

class PokemonDetailRouter: PokemonDetailRouterProtocol {

    class func createPokemonDetailModule(with: String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PokemonDetailView")
        if let view = viewController as? PokemonDetailView {
            let presenter: PokemonDetailPresenterProtocol & PokemonDetailInteractorOutputProtocol = PokemonDetailPresenter()
            let interactor: PokemonDetailInteractorInputProtocol & PokemonDetailRemoteDataManagerOutputProtocol = PokemonDetailInteractor()
            let localDataManager: PokemonDetailLocalDataManagerInputProtocol = PokemonDetailLocalDataManager()
            let remoteDataManager: PokemonDetailRemoteDataManagerInputProtocol = PokemonDetailRemoteDataManager()
            let router: PokemonDetailRouterProtocol = PokemonDetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            presenter.name = with
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "PokemonDetailView", bundle: Bundle.main)
    }
    
}
