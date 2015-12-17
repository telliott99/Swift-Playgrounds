/*
a random String method I came across here:
http://swiftdoc.org/v2.0/type/String/
*/

/*
most important idea here is
how to make a Range<String.Index>
*/

import Cocoa
var str = "Hello, playground"

let n = 8
var b = [UInt8](count: n, repeatedValue: 0)
var m = Int(0)
let p = UnsafeMutablePointer<Int>(bitPattern: m)

let enc = NSUTF8StringEncoding
let opt = NSStringEncodingConversionOptions.AllowLossy

let i = str.startIndex
let j = str.startIndex.advancedBy(4)
let r = Range<String.Index>(start: i, end: j)

str.getBytes(
    &b,
    maxLength: b.count,
    usedLength: p,
    encoding: enc,
    options: opt,
    range: r,
    remainingRange: nil)

b
m
// should have written to m?
