import Foundation

/*
convenience method
count how many times
a particular IntSet is found in an array
*/

// count the number of elements of any Equatable Type
extension Array {
    func elementCount<T: Equatable> (input: T) -> Int {
        var count = 0
        for el in self {
            if el as! T == input {
                count += 1
            }
        }
        return count
    }
}

// ----------------------------

extension SequenceType {
    func findElement (match: Generator.Element->Bool) -> Generator.Element? {
        for element in self where match(element) {
            return element
        }
        return nil
    }
}

struct X {
    let x: Int
}

let o1 = X(x: 10)
let o2 = X(x: 100)

func f(o: X) -> Bool {
    return o.x > 20
}

let o3 = [o1,o2].findElement(f)
print(o3)

// ----------------------------

extension Array {
    func map2<U>(transform: Element->U) -> [U] {
        var result: [U] = []
        result.reserveCapacity(self.count)
        for x in self {
            result.append(transform(x)) }
        return result }
}

let a = [1,2,3].map2 { $0 * $0 }
a

         
