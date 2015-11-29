struct S {
    var n: Int
    init() {
        n = 10
    }
    var description : String {
        get {
        return "\(n)"
        }
    }
    mutating func change(x: Int) {
        n = x
    }
}

var s = S()
var t = S()
print(s)
s.change(20)
print(s)
print(t)    // value semantics (copied)

class C {
    var n: Int
    init() {
        n = 10
    }
}

var c = C()
var d = c
c.n = 20
d.n        // reference semantics

var i = 10
var j = i
i++
j          // value semantics

// Mike Ash

var a: [Int] = [1,2,3]  // [Int]
var b = a
a[1] = 10
b          // value semantics

class Inner {
    var value = 42
}

struct Outer {
    var value = 42
    var inner = Inner()
}

var o1 = Outer()
var o2 = o1
o1.value = 43
o1.inner.value = 43
o2.value
o2.inner.value    // reference semantics

// even though Outer is a struct, its Inner is a reference

// class variables

struct X {
    static var count = 0
    init () {
        X.count += 1
    }
}

var x = X()
let y = X()
X.count

