import UIKit

class PokemonDetailViewController: UIViewController {
    let service = PokemonService()
    let pokemonID: Int
    init(pokemonID: Int) {
        self.pokemonID = pokemonID
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Pokémon Name"
        service.getPokemonDetail(id: pokemonID) { pokemon, error in
            print(pokemon as Any)
            print(error as Any)
        }
    }
}
