import Cocoa

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = possibleString
let implicitString: String = assumedString // no need for an exclamation mark



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


