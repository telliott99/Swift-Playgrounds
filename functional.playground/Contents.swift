let set = Set(["A","B"])
let arr = ["A","B","C"]

var result = arr.filter( { !set.contains($0) } )
result

//==================

var R = 1..<5

let a = R.map( { String($0) } )
a

func f(n: Int) -> String {
    return String(n)
}

R.map(f)

//==================

R = 1..<100

let sum = R.reduce(0, combine: +)
sum

//==================

let a2 = [[1,2], [3]]
a2
let r = a2.flatMap { $0 }
r




