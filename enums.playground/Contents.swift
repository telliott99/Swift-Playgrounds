enum CompassPoint {
    case North
    case South
    case East
    case West
}

var heading = CompassPoint.North
heading
heading = .East
// the type of heading is known

// switch

heading = .South
switch heading {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

//========================

// default value when not all cases are covered

enum Planet {
    case Mercury, Venus, Earth, Mars,
    Jupiter, Saturn, Uranus, Neptune
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//========================

// associated values

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
productBarcode  // UPCA is gone

// funny let

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

// if all values are extracted, only a single let needed

switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}

//========================

// default associated values or raw values
// the same for all vars of that type

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

let c = ASCIIControlCharacter.Tab

switch c {
case .Tab(let value):
    print("tab: \(value)")
default:
    print("not tab")
}

// ???

//========================

// implicit raw values

enum Sun_Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

Sun_Planet.Earth.rawValue




