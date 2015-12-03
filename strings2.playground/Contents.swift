let a = 1..<6
// closure, new String joinWithSeparator method
let s = a.map( {"\($0)"} ).joinWithSeparator(" ")
s



extension String {
    func rjust(n: Int) -> String {
        let extra = n - self.characters.count
        if extra <= 0 {
            return self
        }
        let pad = String(count: extra, repeatedValue: Character("-"))
        return pad + self
    }

    func ljust(n: Int) -> String {
        let length = self.characters.count
        let extra = n - length
        if extra <= 0 {
            return self
        }
        let pad = String(count: extra, repeatedValue: Character("-"))
        return self + pad
    }

    func just(n: Int) -> String {
        let length = self.characters.count
        let extra = n - length
        if extra <= 0 {
            return self
        }
        let left = Int(extra/2)
        var right = left
        if (left*2 + 1 == extra) {
            right += 1
        }
        let first = self.ljust(length+left)
        return first.rjust(n)
    }
}


"abc".rjust(10)
"abc".ljust(10)
"abc".just(10)
