import Foundation

func binaryFormat(a: [UInt8]) -> [String] {
    var ret: [String] = []
    for i in a {
        var s = NSString(format: "%x", i) as String
        if s.characters.count == 1 { s = "0" + s }
        ret.append(s)
    }
    return ret
}

func intArrayToString(a: [UInt8]) -> String {
    var arr: [String] = []
    for n in a {
        let s = Character(UnicodeScalar(UInt32(n)))
        arr.append(String(s))
    }
    return arr.joinWithSeparator("")
}

func stringToIntArray(s: String) -> [UInt8] {
    return s.utf8.map{ UInt8($0) }
}

class Encoder {
    let key: String
    let i: UInt32
    init(_ input: String) {
        key = input
        var n = Int(key.hashValue)
        if n < 0 { n *= -1 }
        if n > Int(UInt32.max) { n = n % 20000000 }
        i = UInt32(n)
        seed()
    }
    func seed() {
        srand(i)
    }
    func next() -> UInt8 {
        return UInt8( Int(rand()) % 256 )
    }
    
    func keyStream(length: Int) -> [UInt8] {
        var arr: [UInt8] = []
        for _ in 0..<length {
            arr.append(self.next())
        }
    return arr
    }
    
    func encrypt(u: [UInt8]) -> [UInt8] {
        self.seed()
        let ks = self.keyStream(u.count)
        var a: [UInt8] = []
        for (p,k) in Zip2Sequence(u,ks) {
            a.append(p^k)
        }
        return a
    }

    func decrypt(a: [UInt8]) -> [UInt8] {
        self.seed()
        let ks = self.keyStream(a.count)
        var ret: [UInt8] = []
        for (c,k) in Zip2Sequence(a,ks) {
            ret.append(c^k)
        }
        return ret
    }
}

let enc = Encoder("myKey")

let plaintext = "MY SECRET"

let p = stringToIntArray(plaintext)
binaryFormat(p).joinWithSeparator(" ")

let ct = enc.encrypt(p)
let result = enc.decrypt(ct)

intArrayToString(result)


