import Cocoa

//  global swap and sort

var a = Array(1..<10)
swap(&a[1],&a[2])
a


a = a.reverse()
a

let b = a.sort()
a
b

a.sort(>)
a

a.sort(<)
a

a.sortInPlace(<)
a

