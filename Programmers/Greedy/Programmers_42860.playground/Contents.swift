// https://school.programmers.co.kr/learn/courses/30/lessons/42860
// LEVEL 2
import Foundation

func solution(_ name:String) -> Int {
    let userName: [String] = name.map { String($0) }
    var answer: Int = 0
    var moveCount: Int = userName.count - 1 // 기본 오른쪽으로 전진 시 이동 횟수
    
    for (index, value) in userName.enumerated() {
        let aDistance = Character(value).asciiValue! - Character("A").asciiValue!
        let zDistance = Character("Z").asciiValue! - Character(value).asciiValue! + 1 // A에서 Z간 거리 더해줌
        let minDistance: Int = Int(min(aDistance, zDistance))
        
        answer += minDistance
        
        var endIndex: Int = index + 1
        while endIndex < userName.count && userName[endIndex] == "A" {
            endIndex += 1
        }
        
        // 앞으로 이동 후 A 만나서 뒤로
        let moveForward = index * 2 + userName.count - endIndex
        // 뒤로 이동 후 A 만나서 다시 앞으로
        let moveBackward = index + (userName.count - endIndex) * 2
        moveCount = min(moveCount, moveForward)
        moveCount = min(moveCount, moveBackward)
    }
    return answer + moveCount
}

let name = "JAZ"
print("answer: \(solution(name))") // 11

//let name1 = "JEROEN"
//print("answer: \(solution(name1))") // 56

//let name2 = "JAN"
//print("answer2: \(solution(name2))") // 23

//let name3 = "LAABAA"
//print("answer3: \(solution(name3))") // 15

//let name4 = "ABABAABA"
//print("answer4: \(solution(name4))") // 9

//let name5 = "AAAABABAAAA"
//print("answer5: \(solution(name5))") // 8
