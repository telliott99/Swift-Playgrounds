// byte counting

func bytecount(s:String) -> Int {
    return s.utf8.count
}

let s = "\u{65}\u{301}lan"
let a = Array(s.utf8)
bytecount(s)
s.characters.count
s.utf8.count

// ============

// arg1 does not need an external parameter name
// and using the _ will trigger a warning

// func f1(_ s: String) {  // warning

func f1(s: String) {
    print(s)
}

f1("abc")

// ============

// but arg1 can have an external parameter name

func f2(input s: String) {
    print(s)
}

f2(input: "abc")  // "input: " required

// ============

// arg2 doesn't really need an external parameter name
// here is the _ which makes it ______ (anonymous?)

func f3(s1: String, _ s2: String) {
    print(s1 + s2)
}

f3("abc", "def")

// ============

// external and internal params the same name
// (no more using #, removed in Swift 2)

func containsCharacter(string s: String, char c: Character) -> Bool {
    for item in s.characters {
        if item == c {
            return true
        }
    }
    return false
}

containsCharacter(string: "aardvark", char: "v")

// ============

// return a function from a function

func adder(n: Int) -> (Int -> Int) {
    func f(m:Int) -> Int {
        return n + m
    }
    return f
}

var addOne = adder(1)
addOne(5)
adder(2)(7)


// ============

// function as an arg

func myfilter(list a: [Int], f cond:Int->Bool) -> [Int] {
    var result:[Int] = []
    for e in a {
        if cond(e) {
            result.append(e)
        }
    }
    return result
}

func notLessThanZero(number: Int) -> Bool {
    return number >= 0
}

let arr = [1,2,-13]
myfilter(list:arr, f: notLessThanZero)

// ============

// default arg

func join(s1: String, _ s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}
join("hello","world")
join("hello","world",joiner: ".-.")

// ============

// return a tuple

func minMax(array: [Int]) -> (lo: Int, hi: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let result = minMax([1,2,3])
result.lo
result.hi

// ============

// variadic arg... (number of elements not known)

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
