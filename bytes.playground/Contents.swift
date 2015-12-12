import Foundation

let x1 = "s".utf8.first!
x1 is UTF8.CodeUnit
for c in "s".utf8 { print(c) }


// bytes are just integers 0..255

// convert a single integer to hex
"0x" + String(UInt8(96), radix: 16)

// using Cocoa
import Cocoa
NSString(format: "0x%x", 96)

// convert a single integer to binary
"0b" + String(UInt8(96), radix: 2)
// leading 0???

// using Cocoa you have to build it
// http://stackoverflow.com/questions/655792/how-to-convert-nsinteger-to-a-binary-string-value

// convert hex or bin to int
let j = 0x60
let k = 0b01100000

// bytes as hex
var a: [UInt8] = [0x60,0x61,0x62]

// bytes to NSData
// This requires the [UInt8] declaration above
import Cocoa
var data = NSData(bytes: a, length: 3)

// convert binary data to a byte
// UInt8 integer
let x: UInt8 = 0b01100011

/*
// a UnicodeScalar can take a UInt8, 16 or 32
var b = UInt32(x)
UnicodeScalar(x)
Character(UnicodeScalar(b))

// Character(UInt32(99))  // doesn't work

String(Character(UnicodeScalar(UInt32(x))))
String(b)
*/

//====================================

let smiley = "\u{1F60E}"
Array(smiley.utf8)

// using Cocoa
var a2 = [0xF0,0x9F, 0x98, 0x8E]
NSString(bytes:a, length:a.count, encoding:NSUTF8StringEncoding)

// what's wrong with this one?
let a3 = Array(smiley.utf16)
NSString(bytes:a3, length:a3.count, encoding:NSUTF16StringEncoding)

// forgot I had this!!
var b: [UInt8] = [0x60,0x61,0x62]
b
let d = NSData(bytes: b, length: 3)
d.length

let count = d.length/sizeof(UInt8)
var a4 = [UInt8](count: count, repeatedValue: 0)
d.getBytes(&a4, length:count * sizeof(UInt8))
a4

// another way:

let n = 256
let arr = Array(0..<n).map { UInt8($0) }

data = NSData(bytes: arr, length: a.count)

let stream = NSInputStream(data: data)
stream.open()

// allocate the memory we need
var buffer = Array<UInt8>(count: n * sizeof(UInt8), repeatedValue: 0)
print(buffer)


stream.read(&buffer, maxLength: n)
// result indicates the number of bytes read

buffer

stream.hasBytesAvailable

// there is a leading 0 ??
// var arr: [UInt8] = []
let R = Array(0..<n)
let arr2: [UInt8] = R.map { buffer[$0] }
arr2


//====================================

/*
- ``~`` not
- ``|`` or
- ``^`` xor
- ``<<`` left shift
- ``>>`` right shift
*/

let key = "MYKEY"
let text = "PTEXT"

let kA = key.utf8
let tA = text.utf8
var cA = [UInt8]()
for (k,t) in Zip2Sequence(kA,tA) {
    cA.append(k^t)
}

var pA = [Character]()
for (k,c) in Zip2Sequence(kA,cA) {
    let s = Character(UnicodeScalar(UInt32(k^c)))
    pA.append(s)
}

String(pA)



// NSData -> BinaryData [UInt8]
func dataToBinaryData(data: NSData) -> [UInt8] {
    let stream = NSInputStream(data: data)
    stream.open()
    
    // having loaded data from a file
    // how to know how large a buffer we will need?
    
    // a total hack
    // let n = (String(data).characters.count - 2)/2
    let n = data.length
    
    var buffer = Array<UInt8>(count: n * sizeof(UInt8), repeatedValue: 0)
    
    stream.read(&buffer, maxLength: n)
    return buffer
}

let a: [UInt8] = [97,98,99]
let data = NSData(bytes: a, length: a.count)
let a2 = dataToBinaryData(data)
a2.count



