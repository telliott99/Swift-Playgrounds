struct MyList: CollectionType {
    
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

struct CollectionGenerator <T>: GeneratorType {
    var items: Array<T>
    mutating func next() -> T? {
        if items.isEmpty { return .None }
        // my modification:
        let item = items.removeAtIndex(0)
        return item
    }
}

extension MyList: SequenceType {
    func generate() -> CollectionGenerator<String> {
        // let n = args.count - 1
        return CollectionGenerator(items: args)
    }
}

let mL = MyList(sL: ["Tom","Dick","Harry"])
for s in mL {
    print(s)
}



