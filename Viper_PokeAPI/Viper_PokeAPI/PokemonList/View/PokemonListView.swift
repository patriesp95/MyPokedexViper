//
//  PokemonListView.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation
import UIKit

class PokemonListView: UIViewController {

    // MARK: Properties
    var presenter: PokemonListPresenterProtocol?
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    var pokemons = [String]()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PokemonListView: PokemonListViewProtocol {
    
    func showPokemons(with pokemons: [Pokemon]) {
        pokemons.forEach { pokemon in
            self.pokemons.append(pokemon.name)
        }
        
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
    
    func showActivity() {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.hidesWhenStopped = true
        }
    }
}

extension PokemonListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(self.pokemons[indexPath.row])"
        return cell
    }
}

extension PokemonListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetail(with: self.pokemons[indexPath.row])
    }
}
