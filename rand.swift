import Foundation

/*
rand, random are can be seeded, e.g.
srandom(time(NULL))

arc4random, arc4random_uniform lack this capability,
but are preferred for *really* random PRNG
 
However, for encryption we need the ability to
generate a keystream for a given key

RAND_MAX is equal to 2147483647 = 2^31 - 1
*/

// these should be extensions on Array
// restricted to Array<Double> ??

func sum(a: [Double]) -> Double {
    return a.reduce(0, combine: +)
}

func average(a: [Double]) -> Double {
    return sum(a) / Double(a.count)
}

func variance(a: [Double]) -> Double {
    let avg = average(a)
    let arr = a.map { ($0 - avg) * ($0 - avg) }
    return average(arr) 
}

func stdev(a: [Double]) -> Double {
    return sqrt(variance(a))
}

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self) as String
    }
}

//-------------------------------------------

// OK, let's get some random ints 0..255

srand(UInt32(time(nil)))

let n = 1000000
var a: [Int] = []
for i in 0..<n {
    a.append(Int(rand()) % 256)
}

// now examine the distribution:
var D: [Int:Int] = [:]
for i in a {
    if let value = D[i] {
        D[i] = value + 1
    }
    else {
        D[i] = 1
    }
}

let vL = Array(D.values)
let max = vL.maxElement()!
let min = vL.minElement()!
print("max: \(max)")
print("min: \(min)")

// http://stackoverflow.com/questions/24051314/precision-string-format-specifier-in-swift

// map to Double type
let da = vL.map { Double($0) }
let avg = average(da)
let sd = stdev(da)

print("avg: \(avg.format(".2"))")
print("sd:  \(sd.format(".2"))")
let high = (Double(max) - avg) / sd
let low = (avg - Double(min)) / sd
print("extremes, high: \(high.format(".2")), low: \(low.format(".2"))")

/*
typical output:

> xcrun swift test.swift
max: 4096
min: 3737
avg: 3906.25
sd:  60.09
extremes, high: 3.16, low: 2.82
>
*/

