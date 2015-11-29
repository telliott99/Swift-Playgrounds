// is used to query the type

let i = 5
i is Int
i is String

// as! v. as?
// ? is conditional, ! is forced

protocol Incrementable {
    func addOne()
}

class X: Incrementable {
    var i = 1
    func addOne() {
        i += 1
    }
}

func performActivity(obj: AnyObject) {
    if let o = obj as? Incrementable {
        o.addOne()
    }
    else {
        print("oops \(obj)")
    }
}

var x = X()
x.i
x.addOne()
x.i

class Y { }
let y = Y()

performActivity(x)
x.i
performActivity(y)



let oa: [AnyObject] = [x,y]
for o in oa {
    performActivity(o)
}

x.i