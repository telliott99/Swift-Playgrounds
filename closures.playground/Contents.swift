/*
The sort(_:) method accepts a closure that takes two arguments of the same type as the array’s contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted.
*/

var letters = ["B","A","C"]

// default sort

var result = letters.sort()

// sort returns the sorted Array

letters
result

//===========================

// reverse sort

letters = ["A","B","C"]

// just pass in a function

func cmp(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

result = letters.sort(cmp)
letters
result

// another change for Swift 2!!, not in language guide
// there is a function sortInPlace that takes no args

letters = ["C","B","A"]
letters.sortInPlace()
letters


//===========================

// closure expression syntax
// here we pass a closure as an argument to sortInPlace
// how can we do this if it takes no args?

letters.sortInPlace({
    (s1: String, s2: String) -> Bool in
        return s1 > s2
})

letters = ["A","B","C"]
letters
letters.sortInPlace(cmp)
letters

//===========================

// making it shorter..
// all of the types can be inferred

letters = ["A","B","C"]

letters.sortInPlace( {
    s1, s2 in
    return s1 > s2
})

letters

//===========================

// making it shorter..
// implicit return value

letters = ["A","B","C"]

letters.sortInPlace( {
    s1, s2 in
    s1 > s2
})

letters


//===========================

// making it shorter..
// shorthand argument names

letters = ["A","B","C"]

letters.sortInPlace( {
    $0 > $1
})

letters

//===========================

// making it shorter..
// Operator functions

letters = ["A","B","C"]

letters.sortInPlace(>)

letters

//===========================

// trailing closure
// closure must be the last arg

letters = ["C","A","B"]

letters.sortInPlace { $0 < $1 }

letters

//===========================

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// example from docs of a trailing closure

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

strings

// looks like magic!

// map is applied to *each* member of the array
// (var number) -> String in
// type of number is inferred (specifying it is OK)

// then we just build the output



