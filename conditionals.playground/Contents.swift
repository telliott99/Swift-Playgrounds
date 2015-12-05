// the standard stuff, but also label

x:
while true {
    for i in 1..<3 {
        
        print(".") {
            for c in "abc".characters {
                print(c)
                if i == 3 && c == "c" {
                    break x
                }
            }
    }
}

