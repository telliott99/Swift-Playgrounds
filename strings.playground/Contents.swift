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

// an alternative way to join an an array of Strings
sa.reduce("", combine: +)


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


print(s2, terminator:"")
func printWithSepTerm(s: String,
                      _ sep: String = "",
                      _ term: String = "") {
    var cL = s.characters
    let n = cL.count
    if n == 0 { return }
                        
    var a = [cL.removeFirst()]
    for c in cL {
        a.append(Character(sep))
        a.append(c)
    }
    a.append(Character(term))
    print(String(a), terminator:"")
}

printWithSepTerm("abc","*",".")


