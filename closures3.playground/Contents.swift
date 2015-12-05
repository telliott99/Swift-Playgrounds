var iL = [Int]()

// initialization required even though value is not used
var x: Int = 0

func f() -> (() -> Void )  {
    x = -1
    func g() {
        iL.append(x)
    }
    return g
}

let h = f()

for i in 1...3 {
    x = i
    h()
}

iL

