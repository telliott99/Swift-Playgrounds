// Mike Ash

extension CollectionType {
    func myMap<U>(f: Self.Generator.Element -> U) -> [U] {
        var result: [U] = []
        for elt in self {
            result.append(f(elt))
        }
        return result
    }
}

let a = [1, 2, 3, 4].myMap({ $0 * 2 })
a
