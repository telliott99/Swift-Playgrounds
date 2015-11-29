enum MyError: ErrorType {
    case UserError
    case NetworkError
}

func doStuff(flag: Bool) throws -> String {
    print("stuff1")
    print("stuff2")
    if !flag {
        throw MyError.NetworkError
    }
    return "value"
}

do {
    try doStuff(false)
} catch MyError.NetworkError {
    print("NetworkError")
}

try doStuff(true)

