//
//  PokemonListWireFrame.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation
import UIKit

class PokemonListRouter: PokemonListRouterProtocol {
   
    class func createPokemonListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? PokemonListView {
            let presenter: PokemonListPresenterProtocol & PokemonListInteractorOutputProtocol = PokemonListPresenter()
            let interactor: PokemonListInteractorInputProtocol & PokemonListRemoteDataManagerOutputProtocol = PokemonListInteractor()
            let localDataManager: PokemonListLocalDataManagerInputProtocol = PokemonListLocalDataManager()
            let remoteDataManager: PokemonListRemoteDataManagerInputProtocol = PokemonListRemoteDataManager()
            let router: PokemonListRouterProtocol = PokemonListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "PokemonListView", bundle: Bundle.main)
    }
    
    func presentView(from view: any PokemonListViewProtocol, with: String) {
        let detailView = PokemonDetailRouter.createPokemonDetailModule(with: with)
        
        if let view = view as? UIViewController {
            view.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
}
