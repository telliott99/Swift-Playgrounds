import Foundation

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

var a  = Array(Range(0..<100))
a[Range(95..<a.count)]
random_shuffle(&a)
random_shuffle(&a)
let a2 = random_shuffle(&a)
a2 == a
a[Range(95..<a.count)]


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

infix operator ^^ { }
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

(2^^31) - 1
(UInt32.max - 1)/2

/*
Note:
UInt32.max equals 4294967295
random() yields [1, 2**31 - 1)
2**31 - 1 = 2147483647 = (UInt32.max - 1)/2
*/



