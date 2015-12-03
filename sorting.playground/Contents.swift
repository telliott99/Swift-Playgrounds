import Cocoa

//  global swap and sort

var a = Array(1..<10)
swap(&a[1],&a[2])
a


a = a.reverse()
a

let b = a.sort()
a
b

a.sort(>)
a

a.sort(<)
a

a.sortInPlace(<)
a




Range(start:0, end:4)

func random_shuffle(inout a: [Int]) -> [Int] {
    let n = a.count
    if n < 2 {
        return a
    }
    for i in Range(start:0, end:n-2) {
        // arc4random_uniform: uniform int in 0..< upper bound
        let k = Int(arc4random_uniform(UInt32(n - i)))
        if k == 0 { continue }
        swap(&a[i], &a[i+k])
    }
    return a
}

a
random_shuffle(&a)
random_shuffle(&a)
random_shuffle(&a)
a

// ===========================
// from StackOverflow

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

a.sort()
a.shuffle()
var c = ["Joe","Bob","Tom"]
c.shuffle()


arc4random_uniform(UInt32.max)
UInt32.max

