//https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    if A.count == 0 {
        return []
    }
    print("acount: \(A.count), ㅏ: \(K)")
    let shiftTimes = K % A.count
    print("shift: \(shiftTimes)")
    
    
    for i in 0..<shiftTimes {
        print("\(i) 번쨰 루프")
        let last = A.last!
        A.removeLast()
        A.insert(last, at: 0)
    }
    
    return A
}

var A = [3, 8, 9, 7, 6]
let K = 3
print("answer: \(solution(&A, K))")
