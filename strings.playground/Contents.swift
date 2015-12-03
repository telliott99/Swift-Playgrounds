// use + and += to combine Strings
var s = ""
s += "abc"
print(s)
//  prints "abc\n"

// use append to add a character to a String
let c: Character = "\u{203C}" //  ‼
s.append(c)

// use the String initializer with an array of Characters
let cL: [Character] = ["C", "a", "t", "!"]
s = String(cL)

print(cL, separator:".", terminator:"*")
// C.a.t*

print("ABC",terminator:"")
// no newline

// "character view"
"Dog".characters
Array("Dog".characters)

// other properties
"Dog".characters.count

// interpolation
let x = 5
s = "x equals \(x)"
s

var i = s.startIndex
var j = s.endIndex
var r = Range(start:i, end:j)
s[r]
s[i.advancedBy(3)]
s[j.advancedBy(-1)]

//================================

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
print("\(eAcute) \(combinedEAcute)")
eAcute == combinedEAcute
s = String(combinedEAcute)
s.characters.count
Array(s.utf8)

// string split
s = "Tom,Sean,Joan"
import Foundation
NSString(string: s).componentsSeparatedByString(",")

// string split in Swift is changing a lot, currently
let result = s.characters.split{$0 == " "}.map(String.init)
result


var sa = ["a","b"]
let s2 = sa.joinWithSeparator("\n")
print(s2)
print(s2, terminator:"")

// split works on a CharacterView
// cannot call with ""

let r2 = s.characters.split() {$0 == "\n"}.map{String($0)}
r2

let sc = "ab".characters
sa = Array(sc).map( { String($0) } )
sa


// searching
s = "supercalifragilistic"
s.rangeOfString("cali")
Array(s.characters.dropFirst(15))
String(s.characters.dropFirst(15))

// Apple example:

extension String {
    var banana : String {
        let shortName = String(characters.dropFirst(1))
        return "\(self) \(self) Bo B\(shortName) Banana Fana Fo F\(shortName)"
    }
}
let bananaName = "Jimmy".banana




extension String {
    private func divide(s: String, n: Int) -> [String] {
        var ret = [String]()
        var current = s
        while true {
            let m = current.characters.count
            if m == 0 {
                break
            }
            if m < n {
                ret.append(current)
                break
            }
            let i = current.startIndex.advancedBy(n)
            let front = current.substringToIndex(i)
            ret.append(front)
            current = current.substringFromIndex(i)
        }
        return ret
    }
    
    func withNewlines(every n: Int) -> String {
        let ret = divide(self, n: n)
        return ret.joinWithSeparator("\n")
    }
    
    func withoutNewlines() -> String {
        /*
        get the CharacterView, like an [Character]
        split to chunks on newlines
        split takes a closure
        
        the results are not Strings
        which joinWithSeparator requires,
        so do the conversion for each one with map
        */
        
        let r = self.characters.split() {$0 == "\n"}.map{String($0)}
        return r.joinWithSeparator("")
    }
    
}

"ABCDEFGHI".withNewlines(every: 3)
let t = "ABCDEFGHI".withNewlines(every: 4)
t.withoutNewlines()




