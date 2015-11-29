var r = Range(start: 1, end: 5)
r.contains(1)

// overloaded operator for contains
r ~= 0
r ~= 1


r = 1...6
let q = 1..<7
r == q

var p = r.first!
p
p.successor()


// intervals

let s = ClosedInterval(1...5)
s
// or
// let s = 1...5 as ClosedInterval


let x = 10
switch x {
case 1...Int.max as ClosedInterval:
    print("positive")
case Int.min..<0 as HalfOpenInterval:
    print("negative")
case 0:
    print("zero")
default:
    fatalError("Should be unreachable")
}