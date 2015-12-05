// pow(2,3)  // fails, it is for doubles, not integers

import Cocoa

// must declare first
infix operator ** {}

func ** (lhs: Int, rhs: Int) -> Int {
    precondition(Int(rhs) >= 0, "exp must be >= 0")
    let value = pow(Double(lhs), Double(rhs))
    return Int(value)
}

2**8
-2**9

// Swift has ++  !!
var i = 0
i++
i
++i

/*
nil coalescing operator ??

“The nil coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type.”
*/

var s: String? = nil
let a = "a"
(s ?? a)
s = "b"
(s ?? a)

// shorthand for
s != nil ? s! : "b"

