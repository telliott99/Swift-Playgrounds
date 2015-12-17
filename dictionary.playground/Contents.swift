/*:
Here is the [link](http://rosettacode.org/wiki/Hash_from_two_arrays#Swift) for this code
*/

let keys = ["a","b","c"]
let vals = [1,2,3]

var hash = [String: Int]()
for (key, val) in zip(keys, vals) {
    hash[key] = val
}

hash

