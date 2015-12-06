import Foundation

// writing map
// a rather silly example, but a start

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

var a = [1,2,3]
a.myStringMap(f)
a.myStringMap(f2)

// -----------------------------------------

// generics

extension Array {
    func myMap<U>( f: Element -> U ) -> [U]  {
        var a: [U] = []
        for item in self {
            a.append(f(item))
        }
        return a
    }
}

let b = a.myMap { 2*$0 }
b
let c = a.myMap { "s" + String($0)+"." }
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

let d = a.myMap2 { 2*$0 }
d

// an array of functions

func go1() -> String { return "go1" }
func go2() -> String { return "go2" }
func go3() -> String { return "go3" }
func go4() -> String { return "go4" }
let arr = [go1,go2,go3,go4]

let e = a.myMap2 { arr[$0]() }
e


extension Array {
    func myFilter( filterFunc: Element -> Bool ) -> [Element]  {
        var result: [Element] = []
        result.reserveCapacity(self.count)
        for item in self {
            if filterFunc(item) {
                result.append(item)
            }
        }
        return result
    }
}


protocol Remainderable {
    func mod(i: Int) -> Bool
}

extension Int {
    func isMultiple(i: Int) -> Bool {
        return (self % i) == 0
    }
}

// could not make this work..
func f3<T: Remainderable>(t: T) -> Bool {
    return t.mod(2)
}

let result = [1,2,3].myFilter { $0.isMultiple(2) }
result


