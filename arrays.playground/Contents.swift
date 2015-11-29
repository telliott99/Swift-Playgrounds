var a = ["abc","def"]
for c in a { print(c)}

a.count
a.isEmpty
a.append("xxx")
a[2] = "ghi"
a

// optionals!
a.first
a.last

let result = a.reverse()
a
Array(result)

let r = (1..<10)
var a2 = Array(r)

a.contains("def")
a2.contains(2)

let a3: [Int] = []
a3.isEmpty

var o: Int?
o = a3.first
o

a = ["a","b","c"]
a.insert("spam", atIndex: 1)
a[1..<3]

a.insert("eggs", atIndex: 0)

// an optional
a.indexOf("spam")

a.removeFirst()
a.removeRange(1..<3)

a[0] = "spam"
a
a.removeLast()
a += ["spam","spam"]

for _ in a {
    print("yes")
}

//-------------------------

// one way to split a string
let arr = "abcde".characters.map( { String($0) } )
arr

arr.count
arr.isEmpty
arr[0]
arr[arr.count-1]
print("\(arr)")

arr.first!

arr.indexOf("b")
var b = arr
b.removeLast()
b
b += arr
b
b[0..<4]

b = b.filter( { Set(["a","b"]).contains($0) } )
b

let evens = (1..<10).filter( { $0 % 2 == 0 } )
evens

// inout and refs

func swap <T>(inout a: [T], _ i: Int, _ j: Int) {
    let tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
}

swap(&b,0,1)   // note the &
var c = Array(1..<4)
swap(&c, 0, 1)

//---------------------------------

typealias IntSet = Set<Int>

extension Array {
    func elementCount<T: Equatable> (input: T) -> Int {
        var count = 0
        for el in self {
            if el as! T == input {
                count += 1
            }
        }
        return count
    }
}

let arr2 = Array(count:5, repeatedValue:Set([1,2,3]))
let st = Set([1,2,3])
arr2.elementCount(st)


let R = "123".characters
let d: [String] = R.map( { "A" + String($0) } )
d



struct Person {
    let name: String
    let age: Int
}

var p = Person(name: "Tom", age: 60)
print("\(p)")






