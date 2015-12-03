// dictionaries are value types

let d1 = ["A":1,"B":2]
var d2 = d1
d1 == d2

d2["B"] = 3
d1
d2
d1 == d2

let s1 = Set([1,2,3])
let s2 = Set([3,4])
s1.union(s2)
s1.union([5,6])

s1.intersect(s2)
s1.exclusiveOr(s2)

var s3 = s1
s3.exclusiveOrInPlace(s2)
s3

// sets are value types too
s1

// an extension on a protocol
// so everybody gets it!

extension CollectionType {
    func myMap<U>(f: Self.Generator.Element -> U) -> [U] {
        var result: [U] = []
        for elt in self {
            result.append(f(elt))
        }
        return result
    }
}

var r = [1, 2, 3, 4].myMap({ $0 * 2 })
// This produces [2, 4, 6, 8]
r

r = Set([1,2]).myMap( { $0 * 2 } )
r



