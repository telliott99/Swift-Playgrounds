import Foundation

// writing map
// a rather silly example, but it's a start

func f<T>(t: T) -> String {
    return "ho"
}

func f2(t: Int) -> String {
    return "\(t)"
}

extension Array {
    func myStringMap( f: Element -> String ) -> [String]  {
        var a: [String] = []
        for item in self {
            a.append(f(item))
        }
        return a
    }
}

let R = [1,2,3,4,5]
R.myStringMap(f)
R.myStringMap(f2)

// -----------------------------------------

// my attempt using generics

extension Array {
    func myMap<U>( f: Element -> U ) -> [U]  {
        var a: [U] = []
        for item in self {
            a.append(f(item))
        }
        return a
    }
}

let b = R.myMap { 2*$0 }
b
let c = R.myMap { "s" + String($0)+"." }
c

// -----------------------------------------

/* 
Advanced Swift
name things more expressively
reserve capacity

generic U for output type depending on
transform(_: Element) -> U
*/

extension Array {
    func myMap2<U>( transform: Element -> U ) -> [U]  {
        var result: [U] = []
        result.reserveCapacity(self.count)
        for item in self {
            result.append(transform(item))
        }
        return result
    }
}

let d = R.myMap2 { 2*$0 }
d

// an array of functions

func go1() -> String { return "go1" }
func go2() -> String { return "go2" }
func go3() -> String { return "go3" }
func go4() -> String { return "go4" }
let arr = [go1,go2,go3,go4]

let e = [0,1,2,3].myMap2 { arr[$0]() }
e


extension Array {
    func myFilter( filterFunc: Element -> Bool ) -> [Element]  {
        var result: [Element] = []
        result.reserveCapacity(self.count)
        for item in self where filterFunc(item) {
                result.append(item)
        }
        return result
    }
}

// -----------------------------------------

// could not make this work..
protocol Remainderable {
    func mod(i: Int) -> Bool
}

// could not make this work..
func f3<T: Remainderable>(t: T) -> Bool {
    return t.mod(2)
}

extension Int {
    func isEvenlyDividedBy(i: Int) -> Bool {
        return (self % i) == 0
    }
}

let result = [1,2,3,4].myFilter { $0.isEvenlyDividedBy(2) }
result

// -----------------------------------------

extension SequenceType {
    func all(filterFunc: ((Generator.Element) -> Bool)  ) -> Bool {
        for item in self {
            if !filterFunc(item) {
                return false
            }
        }
        return true
    }
}

func lessThanZero(i: Int) -> Bool {
    return i < 0
}

var flag = [-1,-2,-3].all( { $0 < 0 } )
flag

// -----------------------------------------

extension SequenceType {
    func indicesOf(filterFunc: ((Generator.Element) -> Bool) ) -> [Int] {
        var result: [Int] = []
        for (i,item) in self.enumerate() {
            if filterFunc(item) {
                result.append(i)
            }
        }
        return result
    }
}

let r2 = [0,1,2,3].indicesOf { $0 > 1 }
r2

// -----------------------------------------

extension Array {
    func accumulate<U>(initial: U, combine: (U, Element) -> U) -> [U] {
        var running = initial
        return self.map { next in
            running = combine(running, next)
        return running }
    }
}

Array(0...8).accumulate(0, combine: +)

// book says built-in map might not be in order
// necessarily
// but looks like it is so far...


flag = [1,2,3].contains { $0 > 1 }
flag

let suits = ["♣", "♦", "♥", "♠"]
let ranks = ["J","Q","K","A"]

let allCombinations = suits.flatMap {
    suit in ranks.map { rank in (suit, rank)  } }
allCombinations


suits.flatMap { suit in ranks.map { rank in (suit, rank)  } }

// $0 is shorthand for:  suit in something(suit)
// in introduces the actual function part
// equivalent to

var arr5: [(String,String)] = []
for s in suits {
    for r in ranks {
        arr5.append((s,r))
    }
}
arr5



