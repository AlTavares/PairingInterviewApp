struct PokemonViewData {
    let id: Int
    let name: String
    let imageURL: String
    let types: [String]
    
    static func mockList() -> [Self] {
        [
            PokemonViewData(id: 1,
                            name: "Bulbasaur",
                            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                            types: ["grass", "poison"]),
            PokemonViewData(id: 4,
                            name: "Charmander",
                            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
                            types: ["fire"]),
            PokemonViewData(id: 7,
                            name: "Squirtle",
                            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
                            types: ["water"]),
        ]
    }
}
