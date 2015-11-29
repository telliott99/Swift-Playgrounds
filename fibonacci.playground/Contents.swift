// type info is not necessary
// var g: RangeGenerator<Int> = Range(start:1,end:5).generate()
// usually an Array, but can be a Range
var g = Range(start:1,end:5).generate()

var a: [Int] = []
while let i = g.next() {
    a.append(i)
}
a

g = Range(start:1,end:5).generate()
Array(g)

// hack to allow up to N numbers
// doesn't work anyway
let N = 50

class FibonacciGenerator: GeneratorType {
    typealias Element = Int
    var a = 0, b = 1
    var count = 0
    func next() -> Int? {
        count += 1
        if count > N {
            return nil
        }
        let tmp = a
        a = b
        b = tmp + b
        return a
    }
}

let fg = FibonacciGenerator()
fg.next()
fg.next()
fg.next()

class Fibonacci {
    typealias GeneratorType = FibonacciGenerator
    func generate() -> FibonacciGenerator {
        return FibonacciGenerator()
    }
}

var fib = Fibonacci().generate()
fib.next()
fib.next()
fib.next()


