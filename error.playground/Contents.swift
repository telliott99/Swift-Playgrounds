import Foundation

enum MyError: ErrorType {
    case WokeUpLate
    case ForgotAltogether
}

// throw an error
func f(flag: Bool = false) throws -> Bool {
    if !flag {
        throw MyError.WokeUpLate
    }
    return true
}

func g() throws { throw MyError.ForgotAltogether }
func h() { }

func f1() throws {
    throw NSError(domain:"s", code:1, userInfo:nil)
}

// try?  convert possible error to optional
let x = try? f(true)
let y = try? f()
if nil == y { print("nil") }

// do catch
do {
    try g()
    print("got here!")
}
catch MyError.WokeUpLate {
    print("oops")
}
catch MyError.ForgotAltogether {
    print("dang")
}

// try!  disable error propagation
let z = try! f(true)
// error for f(false)


