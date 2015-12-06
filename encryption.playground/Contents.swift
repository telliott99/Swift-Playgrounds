import Foundation

/*
The basic data type is [UInt8]
Conversions to and from that type are for display only
*/

typealias BinaryData = [UInt8]

func binaryFormat(input: BinaryData) -> String {
    let sa = input.map { NSString(format: "%x", $0) as String }
    var ret: [String] = []
    // couldn't figure this one out as map
    for s in sa {
        if s.characters.count == 1 { ret.append("0" + s) }
        else { ret.append(s) }
    }
    return ret.joinWithSeparator(" ")
}

func intArrayToString(input: BinaryData) -> String {
    let ret = input.map { String(Character(UnicodeScalar(UInt32($0)))) }
    return ret.joinWithSeparator("")
}

func stringToIntArray(s: String) -> BinaryData {
    return s.utf8.map{ UInt8($0) }
}

class Encoder {
    let key: String
    let i: UInt32
    init(_ input: String) {
        key = input
        // total hack, need String -> UInt32
        var n = Int(key.hashValue)
        if n < 0 { n *= -1 }
        let maxI = Int(UInt32.max)
        if n >= maxI { n = n % maxI }
        i = UInt32(n)
        seed()
    }
    func seed() {
        srand(i)
    }
    func next() -> UInt8 {
        return UInt8( Int(rand()) % 256 )
    }
    
    func keyStream(length: Int) -> BinaryData {
        var arr: BinaryData = []
        for _ in 0..<length {
            arr.append(self.next())
        }
    return arr
    }
    
    func xor(a1: BinaryData, _ a2: BinaryData) -> BinaryData {
        return Zip2Sequence(a1,a2).map { $0^$1 }
    }
    
    func encrypt(u: BinaryData) -> BinaryData {
        self.seed()
        let ks = self.keyStream(u.count)
        return xor(u,ks)
    }

    func decrypt(a: BinaryData) -> BinaryData {
        self.seed()
        let ks = self.keyStream(a.count)
        return xor(a,ks)
    }
}

let key = "Four score and seven years ago"
let enc = Encoder(key)

let plaintext = "MY SECRET"

let p = stringToIntArray(plaintext)
binaryFormat(p)

let ct = enc.encrypt(p)
binaryFormat(ct)

let result = enc.decrypt(ct)
binaryFormat(result)

intArrayToString(result)


