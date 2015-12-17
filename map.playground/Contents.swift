// we can easily write map, filter or reduce
// for a particular data type

func f(i: Int) -> Int { return i*i }

extension Array {
    // mmap takes a function as its argument
    func mmap(transform: Int -> Int) -> [Int] {
        var ret: [Int] = []
        for Element in self {
            ret.append(transform(Element as! Int))
        }
        return ret
    }
}

let ia = [1,2,3]
ia.mmap(f)  // [1, 4, 9]
let sa = ["a","b"]
// sa.mmap(f)  // error cannot convert value

/*
It is not required to use Element here, but usual.
Notice that although we don't assign
the result of mmap:  a.mmap(f)
we do return a value in the function definition.
ret.reserveCapacity(self.count) would be a nice touch
Now, to write it as a generic
*/

extension Array {
    func mmap<T>(transform: T -> T) -> [T] {
        var ret: [T] = []
        for Element in self {
            ret.append(transform(Element as! T))
        }
        return ret
    }
}

func g(i: Int) -> Int { return i*i }
func g(s: String) -> String { return s + s }

ia.mmap(g)  // [1,4,9]
sa.map(g)   // ["aa", "bb"]

// It is required to cast Element as! T

// We can fix that by changing the argument
// transform: Element -> T
// and we *will* add the reserveCapacity

extension Array {
    func mmap2<T>(transform: Element -> T) -> [T] {
        var ret: [T] = []
        ret.reserveCapacity(self.count)
        for Element in self {
            ret.append(transform(Element))
        }
        return ret
    }
}

ia.mmap2(g)  // [1, 4, 9]
sa.mmap2(g)  // ["aa", "bb"]

// Of course, there is more to it
// @noescape
// throws and rethrows, etc.


