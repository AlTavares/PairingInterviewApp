import Foundation

extension String {
    func appending(path: String) -> String {
        (self as NSString).appendingPathComponent(path)
    }

    mutating func append(path: String) {
        self = appending(path: path)
    }
}
