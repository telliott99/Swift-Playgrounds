class X1: CustomStringConvertible {
    
    var description: String {
        get {
            return "Hi there"
        }
    }
}

let x1 = X1()
print(x1)

//-------------------------------

/*
http://stackoverflow.com/questions/32668635/swift-minimum-implementation-for-types-conforming-to-protocols-with-default-impl

Three properties comprise methods needed for Indexable
That is also the minimum required to be a CollectionType
To be MutableCollectionType, subscript needs a setter
*/

struct MyCollectionType : CollectionType {
    
    var startIndex : Int { return 0 }
    var endIndex : Int { return 1 }
    
    subscript(position : Int) -> String {
        return "I am element #\(position)"
    }
}

let coll = MyCollectionType()
for elem in coll {
    print(elem)
}

//-------------------------------

// for GeneratorType example with MyList 
// see: gen_protocols.playground

struct MyList: CollectionType,
               Indexable {
    
    var args: [String]
    init(sL: [String]) {
        self.args = sL
    }
    
    mutating func append(s: String) {
        args.append(s)
    }
    
    var startIndex: Int { return 0 }
    var endIndex : Int { return args.count }
    
    subscript(i : Int) -> String {
        get {
            return args[i]
        }
    }

    subscript(range: Range<Int>) -> MyList? {
        get {
            // cannot subscript a value of type [MyList]
            // why not?
            let end = range.endIndex
            var i = range.startIndex
            var ret = MyList(sL: [])
            while true {
                if i == end { break }
                ret.append(args[i])
                i += 1
            }
            return ret
        }
    }
}

