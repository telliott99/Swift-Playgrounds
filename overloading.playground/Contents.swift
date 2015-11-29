// functions can be overloaded
// args are part of signature

func test(s: String) {
    print(s)
}

test("a")

func test(i: Int) {
    print(String(i))
}

test(5)




// the pattern matching operator
// is overloaded!


let r = Range(start: 1, end: 5)
r ~= 0
r ~= 1

var p = r.first!
p
p.successor()





