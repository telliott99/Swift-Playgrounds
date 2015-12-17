// merge two dictionaries

extension Dictionary {
    mutating func merge<S: SequenceType
        where S.Generator.Element == (Key,Value)>(other: S) { for (k, v) in other {
            self[k] = v }
    }
}

var D1 = [1:"a", 2:"b"]
let D2 = [3:"c"]
D1.merge(D2)
