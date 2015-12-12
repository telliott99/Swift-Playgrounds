// we can easily write map, filter or reduce
// for a particular data type

extension Array {
    func mmap(transform: Int -> Int) -> [Int] {
        var ret: [Int] = []
        for Element in self {
            ret.append(transform(Element as! Int))
        }
        return ret
    }
}

let a = [1,2,3]
func f(i: Int) -> Int { return i*i }
a.mmap(f)

/* 
It is not required to use Element here, but usual.
Notice that although we don't assign 
the result of mmap:  a.mmap(f)
we do return a value in the function definition.

ret.reserveCapacity(self.count) would be a nice touch

Now, to write it as a generic
*/

extension Array {
    func mmap2<T>(transform: T -> T) -> [T] {
        var ret: [T] = []
        for Element in self {
            ret.append(transform(Element as! T))
        }
        return ret
    }
}

let a2 = ["a","b"]
func g(s: String) -> String { return s + "." }
a2.mmap2(g)

// the only thing weird about it is 
// it is required to cast:  Element as! T
// we can fix that by changing transform
// and we *will* add the reserveCapacity

extension Array {
    func mmap3<T>(transform: Element -> T) -> [T] {
        var ret: [T] = []
        ret.reserveCapacity(self.count)
        for Element in self {
            ret.append(transform(Element))
        }
        return ret
    }
}

let a3 = [2,3,5]
func h(i: Int) -> Int { return 2*i }
a3.mmap3(h)

// Of course, there is more to it
// @noescape 
// throws and rethrows, etc.
