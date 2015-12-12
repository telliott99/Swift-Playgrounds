import Foundation
import CommonCrypto

// turn a password into a key with sufficient randomness
// by key "stretching"

let pw = "my secret"
let pwBytes = pw.utf8.map { Int8($0) }
let pwLen = pwBytes.count
// let pwData = NSData(bytes: pwBytes, length: pwLen)
// not UInt!
let pwPointer = UnsafePointer<Int8>(pwBytes)

let salt = "xyz"
let saltBytes = salt.utf8.map { UInt8($0) }
let saltLen = saltBytes.count
// let saltData = NSData(bytes: saltBytes, length: saltLen)
// not Int!
let saltPointer = UnsafePointer<UInt8>(saltBytes)

let alg = CCPBKDFAlgorithm(kCCPBKDF2)
let hmac = CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA1)
let n = Int(CC_SHA1_DIGEST_LENGTH)
n

// figure out how many rounds needed for 1000ms computation time
let rounds = CCCalibratePBKDF(alg, pwLen, saltLen, hmac, n, 1000)

// Derive the key

let key = Array<UInt8>(count:Int(CC_SHA1_DIGEST_LENGTH), repeatedValue:0)
var keyPointer = UnsafeMutablePointer<UInt8>(key)

CCKeyDerivationPBKDF(
    alg,            // kCCPBKDF2
    pwPointer,
    pwBytes.count,
    saltPointer,
    saltBytes.count,
    hmac,           // kCCPRFHmacAlgSHA1
    rounds,
    keyPointer,
    n)

var bL: [UInt8] = []
for i in 0..<n {
    bL.append(keyPointer[i])
}

bL

