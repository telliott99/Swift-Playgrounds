import Foundation

let t = "a"

var re: NSRegularExpression
let p = "\(t)"
let o = NSRegularExpressionOptions()
try! re = NSRegularExpression(
    pattern: p, options: o)
print("\(re.pattern)")

let s = " a ab abc "
let o2 = NSMatchingOptions()
let r = NSRange(location: 0, length: 3)
var rL = re.matchesInString(
    s, options: o2, range: r)
print("count: \(rL.count)")

for match in rL {
    print(match.range)
    let loc = match.range.location
    let len = match.range.length
    print(loc, len)

    let start = s.startIndex.advancedBy(loc)
    let end = start.advancedBy(len)
    
    let s2 = String(s[start..<end])
    print(s2)
}

s ~= p
p
s
