


func anyCommonElements <T: SequenceType,
    U: SequenceType
    where T.Generator.Element: Equatable,
        T.Generator.Element == U.Generator.Element>
    
    (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

anyCommonElements("abc".characters, Set(["a"]))