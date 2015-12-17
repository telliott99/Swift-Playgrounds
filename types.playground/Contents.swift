// from the book

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// this is OK b/c all are MediaItem
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie { ++movieCount }
}
movieCount

// downcasting
// conditional form of the typecast operator `as?`
for item in library {
    if let song = item as? Song { ++songCount }
}
songCount

// NSArray objects are untyped, this allows mixed Types:
import Foundation

// in Swift the type of items in a is AnyObject
var a: NSArray! = ["x","y",2]
a[0].type

// we can downcast optionally to Int or whatever
for item in a {
    if let value = item as? Int { print(value) }
}

let someObj: [AnyObject] = ["x","y",2]

// for the MediaItem example

let a2: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey",
        director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")]

for object in a2 {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

// alternatively
for movie in a2 as! [Movie] { print("\(movie.name)") }

// -------------------------------------------

// Any is even broader, it can include function types

func g() { }
func h(s: String) -> Bool { return true }

// let a3: [AnyObject] = ["a",1,f]
// error:  value of type '() -> ()' does not conform ...

let a3: [Any] = ["a", 1, g, h]

for item in a3 {
    switch item {
    case let f as (String) -> (Bool):
        f("x")
    default:
        print("oops")
    }
}



