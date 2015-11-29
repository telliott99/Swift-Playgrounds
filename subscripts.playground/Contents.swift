struct Person: CustomStringConvertible {
    var name: String
    var age: Int
    var description: String {
        get {
            return "\(name), age: \(age)"
        }
    }
}

let t = Person(name: "Tom", age: 60)
t

enum Aspect {
    case name
    case age
}


extension Person {
    subscript(aspect: Aspect) -> String {
        get {
            switch aspect {
            case .name: return self.name
            case .age: return String(self.age)
            }
        }
    }
}

let n = Aspect.name
t[n]
t[.age]

// t[n] = "Joan"  // error



