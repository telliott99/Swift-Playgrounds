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

R = 1..<1000

let sum = R.reduce(0, combine: +)
sum
