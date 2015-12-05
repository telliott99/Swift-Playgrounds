// protocol lists functions or required properties

protocol Incrementable {
    func addOne()
}

class X: Incrementable {
    var i = 1
    func addOne() {
        i += 1
    }
}

var x = X()
x.i
x.addOne()
x.i







struct Complex<T: SignedNumberType> {
    let real: T
    let imaginary: T
}

extension Complex: Equatable {}

// MARK: Equatable

func ==<T>(lhs: Complex<T>, rhs: Complex<T>) -> Bool {
    return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
}

let a = Complex<Double>(real: 1.0, imaginary: 2.0)
let b = Complex<Double>(real: 1.0, imaginary: 2.0)

a == b // true
a != b // false



var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })


for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as String -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
