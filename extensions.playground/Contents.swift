extension String {
    private func divide(s: String, n: Int) -> [String] {
        var ret = [String]()
        var current = s.characters
        while true {
            let m = current.count
            if m == 0 {
                break
            }
            if m < n {
                ret.append(String(current))
                break
            }
            let i = current.startIndex
            let j = i.advancedBy(n)
            let k = current.endIndex
            let front = current[Range(start: i, end: j)]
            ret.append(String(front))
            current = current[Range(start: j, end: k)]
        }
        return ret
    }
    
    func withNewlines(every n: Int) -> String {
        let ret = divide(self, n: n)
        return ret.joinWithSeparator("\n")
    }
    
    func withoutNewlines() -> String {
        /*
        get the CharacterView, like an [Character]
        split to chunks on newlines
        split takes a closure
        
        the results are not Strings
        which joinWithSeparator requires,
        so do the conversion for each one with map
        */
        
        let r = self.characters.split() {$0 == "\n"}.map{String($0)}
        return r.joinWithSeparator("")
    }
}

let ret = "abcd".withNewlines(every: 2)
ret.withoutNewlines()



// Mike Ash

extension CollectionType {
    func myMap<U>(f: Self.Generator.Element -> U) -> [U] {
        var result: [U] = []
        for elt in self {
            result.append(f(elt))
        }
        return result
    }
}

let a = [1, 2, 3, 4].myMap({ $0 * 2 })
a
