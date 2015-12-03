// classes are *reference* types

class C {
    var n = 2
}

var c = C()
c.n

let d = c
d.n

c.n = 3
d.n

// structs are *value* types

struct S {
    var n = 2
}

var s = S()
s.n

let t = s
t.n

s.n = 3
t.n

// the identity operator ===

c === d
// s === t  // error, === only for instances of classes
