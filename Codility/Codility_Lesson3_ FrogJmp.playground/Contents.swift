//https://app.codility.com/programmers/lessons/3-time_complexity/frog_jmp/
import Foundation

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    var answer = 0
    let distance = Y - X
    if distance % D != 0 {
        answer += 1
    }
    
    return answer + distance / D
}

let X = 10
let Y = 85
let D = 30

print("answer: \(solution(X, Y, D))")
