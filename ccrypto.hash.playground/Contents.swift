import Foundation
import CommonCrypto

let input = "The quick brown fox jumps over the lazy dog."
let n = Int(CC_MD5_DIGEST_LENGTH)
let bytes = input.utf8.map { UInt8($0) }
let len = CC_LONG(bytes.count)

// CC_MD5 wants this not [UInt8]:
let digest = UnsafeMutablePointer<CUnsignedChar>.alloc(n)

// src, sz, dst
CC_MD5(bytes, len, digest)

// tried map but failed
var hL: [UInt8] = []
for i in 0..<n {
    hL.append(UInt8(digest[i]))
}
digest.dealloc(n)

let sL = hL.map { String(format:"%02x", $0) }
var h = sL.reduce("", combine: +)
print(h)

// alternative for processing in chunks

let ctx = UnsafeMutablePointer<CC_MD5_CTX>.alloc(1)
var digest2 = Array<UInt8>(count:n, repeatedValue:0)

// possible pre-cleaning
let s = input.decomposedStringWithCanonicalMapping

CC_MD5_Init(ctx)
CC_MD5_Update(ctx, s, len)
CC_MD5_Final(&digest2, ctx)
ctx.dealloc(1)

let hL2 = digest2.map { String(format:"%02x", $0) }
h = hL2.reduce("", combine: +)
print(h, terminator: "")
