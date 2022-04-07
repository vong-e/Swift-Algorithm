//https://programmers.co.kr/learn/courses/30/lessons/43165
//LEVEL 2
import UIKit

//func solution(_ numbers:[Int], _ target:Int) -> Int {
//    var answer = 0
//
//
//    dfs(targetArray: numbers, target: target, depth: 0, currentValue: 0, answer: &answer)
//
//    return answer
//}
//
//func dfs(targetArray: [Int], target: Int, depth: Int, currentValue: Int, answer: inout Int) {
//    if depth == targetArray.count {
//        if target == currentValue {
//            answer += 1
//        }
//        return
//    }
//
//    dfs(targetArray: targetArray, target: target, depth: depth + 1, currentValue: currentValue + targetArray[depth], answer: &answer)
//    dfs(targetArray: targetArray, target: target, depth: depth + 1, currentValue: currentValue - targetArray[depth], answer: &answer)
//}

// 22.04.08 풀이
func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    func dfs(currentValue: Int, depth: Int) {
        if depth == numbers.count {
            print("DEPTH: \(depth), CurrentValue: \(currentValue), target: \(target)")
            if currentValue == target {
                print("answer +")
                answer += 1
            }
            return
        }
        
        dfs(currentValue: currentValue + numbers[depth], depth: depth + 1)
        dfs(currentValue: currentValue - numbers[depth], depth: depth + 1)
    }
    
    dfs(currentValue: 0, depth: 0)
    return answer
}

let numbers = [1, 1, 1, 1, 1]
let target = 3
print("리턴: ", solution(numbers, target)) //5


