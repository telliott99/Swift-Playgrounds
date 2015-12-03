import Foundation

extension String {
    func divideIntoChunks(chunkSize n: Int) -> [String] {
        var ret = [String]()
        var current = self
        while true {
            let m = current.characters.count
            if m == 0 {
                break
            }
            if m < n {
                ret.append(current)
                break
            }
            let i = current.startIndex.advancedBy(n)
            
            // requires Foundation (NSString, not String)
            let front = current.substringToIndex(i)
            ret.append(front)
            current = current.substringFromIndex(i)
        }
        return ret
    }
    
    func divideIntoChunks_v2(chunkSize n: Int) -> [String] {
        var ret = [String]()
        let cL = self.characters
        if n >= cL.count {
            return [s]
        }
        let start = cL.startIndex
        var i = 0
        var current = start
        while true {
            if i + n >= cL.count {
                let value = cL[Range(start: current,
                    end: cL.endIndex)]
                ret.append(String(value))
                break
            }
            // else
            i += n
            let last = current.advancedBy(n)
            let value = cL[Range(start: current,
                end: last)]
            ret.append(String(value))
            current = last
        }
        return ret
    }
    
    func insertSeparator(sep: String, every n: Int) -> String {
        let ret = self.divideIntoChunks_v2(chunkSize: n)
        return ret.joinWithSeparator(sep)
    }
    
    func withNewlines(every n: Int) -> String {
        let ret = self.divideIntoChunks(chunkSize: n)
        return ret.joinWithSeparator("\n")
    }
    
    func withoutNewlines() -> String {
        /*
        get the CharacterView, like an [Character]
        split to chunks on newlines
        split takes a closure
        
        the results are not Strings
        which joinWithSeparator requires,
        so do the conversion for each one with map
        */
        
        let r = self.characters.split() {$0 == "\n"}.map{String($0)}
        return r.joinWithSeparator("")
    }

    func stripOccurrencesOfCharactersInList(cL: CharacterView) -> String {
        /*
        get the CharacterView, like an [Character]
        split to chunks on newlines
        split takes a closure
        
        the results are not Strings
        which joinWithSeparator requires,
        so do the conversion for each one with map
        */
        
        var a = [Character]()
        for c in self.characters {
            if cL.contains(c) {
                continue
            }
            a.append(c)
        }
        return a.map{ String($0) }.joinWithSeparator("")
    }
}

var s = "abcdefgh"
s.divideIntoChunks(chunkSize: 2)
s.divideIntoChunks(chunkSize: 3)
s.divideIntoChunks(chunkSize: 9)

s = "abc \ndef"
s.stripOccurrencesOfCharactersInList(" \n".characters)

