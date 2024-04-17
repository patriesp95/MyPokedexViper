//
//  PokemonDetailView.swift
//  Viper_PokeAPI
//
//  Created by Patricia Martínez Espert on 16/4/24.
//  
//

import Foundation
import UIKit

class PokemonDetailView: UIViewController {

    // MARK: Properties
    var presenter: PokemonDetailPresenterProtocol?
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myTypeLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PokemonDetailView: PokemonDetailViewProtocol {
    func showPokemon(with: PokemonCharacteristics) {
        
        DispatchQueue.main.async {
            self.myNameLabel.text = "Type: \(with.types?.first?.type.name ?? "No Type")"
            self.myTypeLabel.text = "Main ability: \(with.abilities?.first?.ability.name ?? "No Ability")"
            guard let pokeURL = with.sprites?.front_default else { return }
            self.myImage.downloaded(from: pokeURL)
        }
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
