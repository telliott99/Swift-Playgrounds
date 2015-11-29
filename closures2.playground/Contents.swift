// closures can capture values from the environment

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    // returns a function that takes no args, returns Int
    
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()

let incrementByFive = makeIncrementer(forIncrement: 5)
incrementByFive()
incrementByFive()

// runningTotal's value is captured

// incrementer is referred to as a closure, even though "func .."

// notice that incrementByTen is a constant (let ..)
// even though runningTotal changes!
// it has reference semantics

//===========================

