import Cocoa

// ? is the declaration of an Optional
let os: String? = "value"

// requires an exclamation mark
let s: String = os!



let optStr: String?
optStr = "a"
if let x = optStr {
    print(x)
}

let str: String? = optStr

/*
str is unwrapped!!
if optStr were nil, the value would be nil
everything after the ? having been ignored
*/

str
str!


/*
“You can think of an implicitly unwrapped optional as giving permission for the optional to be unwrapped automatically whenever it is used.”
*/

let assumedString: String! = os
let implicitString: String = assumedString
implicitString



func f(s: String) -> String? {
    if (s == "a") {
        return "x"
    }
    return nil
}

f("a")
f("b")

func g(s: String) {
    if let t = f(s) {
        print("Guess we got:  \(t)")
    } else {
        print ("Nope")
    }
}

g("a")  // "Guess we got:  x\n"
g("b")  // "Nope\n"




let N = (UInt32.max-1)/2

func maybe() -> Int? {
    if (Double(arc4random())/Double(N) < 0.5) {
        return 1
    }
    else {
        return nil
    }
}

// if let

if let r = maybe() {
    print("yes")
}

if (maybe() != nil) {
    print("yes")
}


