import Cocoa

let N: Int = 256
arc4random_uniform(UInt32(N))

srandom(137)
arc4random_uniform(UInt32(N))
random()
var f = Double(random())/Double(UInt32.max)
f = Double(random())/Double(UInt32.max)


// arc4random_uniform is not seeded

srandom(137)
arc4random_uniform(UInt32(N))
random()
f = Double(random())/Double(UInt32.max)
f = Double(random())/Double(UInt32.max)

// ========================

// I overlooked this for a long time!!!

/*
UInt32.max == 4294967295
random() yields [1,2**31 - 1)
2**31 - 1 = 2147483647 = (UInt32.max - 1)/2
*/

func randomIntInRange(begin: Int, _ end: Int) -> Int {
    let top = Double((UInt32.max - 1)/2)
    let f = Double(random())/top
    let range = end - begin
    // we must convert to allow the * operation
    let result = Int(f * Double(range))
    return result + begin
}

srandom(137)
randomIntInRange(0,256)

// ===========================

class ByteGenerator: GeneratorType {
    // works without typealias
    typealias Element = Int
    func next() -> Int? {
        return randomIntInRange(0,256)
    }
}

class Bytes {
    typealias GeneratorType = ByteGenerator
    func generate() -> ByteGenerator {
        return ByteGenerator()
    }
}

// could be better, just enforce count obj to return
func getKey(length: Int) -> [Int]? {
    var a: [Int] = []
    let gen = Bytes().generate()
    for _ in 0..<length {
        let v = gen.next()
        if (v != nil){
            a.append(v!)
        }
        else {
            
        }
    }
    if (a.count != length) {
        return nil
    }
    return a
}

var a = getKey(6)
a!.maxElement()



