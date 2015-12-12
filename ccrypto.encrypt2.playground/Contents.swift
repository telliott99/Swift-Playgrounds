import Foundation
import CommonCrypto
import Security

let key = "asecret16bytekey"
let keyLen = key.utf8.count

let msg = "messageXXXXXXXXX"
let msgLen = msg.utf8.count
let msgBytes = [UInt8](msg.utf8)

let operation = CCOperation(kCCEncrypt)
let algorithm = CCAlgorithm(kCCAlgorithmAES)

let options = CCOptions()

// AES128 block size is 16 bytes or 128 bits
let blockSize = 128

let bufferSize = 128
var cipherData = [UInt8](count: bufferSize, repeatedValue: 0)
var resultLen = 0
var status: Int32 = 0

var iv = [UInt8](count: blockSize, repeatedValue: 0)
SecRandomCopyBytes(kSecRandomDefault, blockSize, &iv)
iv

status = CCCrypt(
    operation,
    algorithm,
    options,
    key,
    keyLen,
    iv,
    msg,
    msgLen,
    UnsafeMutablePointer<Void>(cipherData),
    bufferSize,
    &resultLen)

status
resultLen
cipherData

var decrypted = [UInt8](count: bufferSize, repeatedValue: 0)

status = CCCrypt(
    CCOperation(kCCDecrypt),
    algorithm,
    options,
    key,
    keyLen,
    iv,
    cipherData,
    bufferSize,
    UnsafeMutablePointer<Void>(decrypted),
    bufferSize,
    &resultLen)

resultLen
status
decrypted
