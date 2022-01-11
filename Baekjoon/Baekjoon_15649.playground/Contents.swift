//https://www.acmicpc.net/problem/15649
//N과 M
import Foundation

func nAndM(n: Int, m: Int) {
    var targetArray: [String] = []
    var permutationArray: [[String]] = []
    for i in 0..<n {
        targetArray.append("\(i+1)")
    }
    
    permutation(array: targetArray, pickCount: m, permutationArray: &permutationArray)

    let joinedPermutationArray = permutationArray.map{$0.joined(separator: " ")}.sorted()
    joinedPermutationArray.forEach { output in
        print(output)
    }
}

func permutation(array: [String], pickCount: Int, permutationArray: inout [[String]], index: Int = 0) -> [[String]] {
    if index == pickCount {
        permutationArray.append(Array(array[0..<index]))
        return []
    }
    
    var arr = array
    for i in index..<array.count {
        arr.swapAt(i, index)
        permutation(array: arr, pickCount: pickCount, permutationArray: &permutationArray, index: index + 1)
        arr.swapAt(i, index)
    }
    
    return permutationArray
}

//For Input
//let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
//let n = nums[0]
//let m = nums[1]
//
//nAndM(n: n, m: m)
//For Input

let n1: Int = 3
let m1: Int = 1
print("N과 M - 1")
nAndM(n: n1, m: m1)
/* 출력
 1
 2
 3
 */

//let n2: Int = 4
//let m2: Int = 2
//print("N과 M - 2")
//nAndM(n: n2, m: m2)
/* 출력
 1 2
 1 3
 1 4
 2 1
 2 3
 2 4
 3 1
 3 2
 3 4
 4 1
 4 2
 4 3
 */

//let n3: Int = 4
//let m3: Int = 4
//print("N과 M - 3")
//nAndM(n: n3, m: m3)
/* 출력
 1 2 3 4
 1 2 4 3
 1 3 2 4
 1 3 4 2
 1 4 2 3
 1 4 3 2
 2 1 3 4
 2 1 4 3
 2 3 1 4
 2 3 4 1
 2 4 1 3
 2 4 3 1
 3 1 2 4
 3 1 4 2
 3 2 1 4
 3 2 4 1
 3 4 1 2
 3 4 2 1
 4 1 2 3
 4 1 3 2
 4 2 1 3
 4 2 3 1
 4 3 1 2
 4 3 2 1
 */
