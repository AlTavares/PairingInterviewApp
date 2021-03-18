import Foundation

// MARK: - NameURLPair

struct NameURLPair: Codable {
    let name: String
    let url: String
}

// MARK: - Pokemon

struct Pokemon: Codable {
    let id, height, weight, baseExperience: Int
    let abilities: [Ability]
    let name: String
    let species: NameURLPair
    let stats: [Stat]
    let types: [TypeElement]

    enum CodingKeys: String, CodingKey {
        case id, height, weight
        case baseExperience = "base_experience"
        case abilities, name, species, stats, types
    }
}

// MARK: - Ability

struct Ability: Codable {
    let ability: NameURLPair
}

// MARK: - Stat

struct Stat: Codable {
    let baseStat, effort: Int
    let stat: NameURLPair

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement

struct TypeElement: Codable {
    let slot: Int
    let type: NameURLPair
}
