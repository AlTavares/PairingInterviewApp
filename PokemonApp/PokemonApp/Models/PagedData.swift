import Foundation

struct PagedData<T: Decodable>: Decodable {
    let count: Int
    let previous: String?
    let next: String?
    let results: [T]
}
