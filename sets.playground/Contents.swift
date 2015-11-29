class Simple: Hashable, Equatable {
    var value: Int
    
    init(x: Int) {
        value = x
    }
    
    var hashValue: Int {
        return value
    }
}

func ==(lhs: Simple, rhs: Simple) -> Bool {
    return lhs.value == rhs.value
}

var el1 = Simple(x: 42)
var el2 = Simple(x: 43)

var t = Set<Simple>()
t.insert(el1)
t.insert(el2)
t

// already in t
t.insert(Simple(x: 42))
t

//=====================


