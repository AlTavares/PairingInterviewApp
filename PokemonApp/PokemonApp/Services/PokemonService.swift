import Foundation

class PokemonService {
    enum Constants {
        static let baseURL = "https://pokeapi.co/api/v2"
    }
    
    func getPokemonList(limit: Int = 100, offset: Int = 0, completion: @escaping ([NameURLPair]?, Error?) -> Void) {
        let url = Constants.baseURL.appending(path: "pokemon?limit=\(limit)&offset=\(offset)")
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            guard let data = data else {
                return completion(nil, error)
            }
            let result = try? JSONDecoder().decode(PagedData<NameURLPair>.self, from: data)
            completion(result?.results, error)
        }.resume()
    }
    
    func getPokemonDetail(id: Int, completion: @escaping (Pokemon?, Error?) -> Void) {
        let url = Constants.baseURL.appending(path: "pokemon/\(id)")
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            guard let data = data else {
                return completion(nil, error)
            }
            let result = try? JSONDecoder().decode(Pokemon.self, from: data)
            completion(result, error)
        }.resume()
    }
    
}
