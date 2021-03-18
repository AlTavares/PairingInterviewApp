import Foundation

// MARK: - PokemonEvolutionChain

struct PokemonEvolutionChain: Codable {
    let id: Int
    let chain: Chain
}

// MARK: - Chain

struct Chain: Codable {
    let evolvesTo: [Chain]
    let species: NameURLPair

    enum CodingKeys: String, CodingKey {
        case evolvesTo = "evolves_to"
        case species
    }
}
