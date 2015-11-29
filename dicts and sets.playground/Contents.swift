// dictionaries are value types

let d1 = ["A":1,"B":2]
var d2 = d1
d1 == d2

d2["B"] = 3
d1
d2
d1 == d2

let s1 = Set([1,2,3])
let s2 = Set([3,4])
s1.union(s2)
s1.union([5,6])

s1.intersect(s2)
s1.exclusiveOr(s2)

var s3 = s1
s3.exclusiveOrInPlace(s2)
s3

// sets are value types too
s1

