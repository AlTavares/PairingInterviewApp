import Foundation

// MARK: - PokemonSpecies

struct PokemonSpecies: Codable {
    let evolutionChain: EvolutionChain

    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
    }
}

// MARK: - EvolutionChain

struct EvolutionChain: Codable {
    let url: String
}
