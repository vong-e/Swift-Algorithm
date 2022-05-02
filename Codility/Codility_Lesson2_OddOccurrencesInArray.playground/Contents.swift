//https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var emptyDict: [Int: Int] = [:]
    
    for i in 0..<A.count {
        if emptyDict[A[i]] == nil {
            emptyDict[A[i]] = 1
        } else {
            emptyDict[A[i]]! += 1
        }
    }
    
    print(emptyDict)
    return emptyDict.keys.filter { emptyDict[$0]! % 2 != 0 }.first!
}

var A = [9, 3, 9, 3, 9, 7, 9]
print("answer: \(solution(&A))")
