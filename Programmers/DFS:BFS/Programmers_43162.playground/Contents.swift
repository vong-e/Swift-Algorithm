//https://programmers.co.kr/learn/courses/30/lessons/43162
//LEVEL 3
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    
    var isVisited: [Bool] = Array.init(repeating: false, count: n)
        
    for i in 0..<n {
        if !isVisited[i] {
            answer += 1
            bfs(computer: i)
        }
    }
    
    func bfs(computer: Int) {
        isVisited[computer] = true
        for i in 0..<n {
            if computers[computer][i] == 1 && !isVisited[i]{
                isVisited[i] = true
                bfs(computer: i)
            }
        }
    }
    
    
    return answer
}
//let n1 = 3
//let computers1 = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
//print("리턴 1: \(solution(n1, computers1))") // answer: 2

//let n2 = 3
//let computers2 = [[1, 1, 0], [1, 1, 1], [0, 1, 1]]
//print("리턴 2: \(solution(n2, computers2))") // answer: 1

let n3 = 4
let computers3 = [[1, 0, 0, 1], [0, 1, 1, 0], [0, 1, 1, 0], [1, 1, 0, 1]]
print("리턴 3: \(solution(n3, computers3))") // answer: 1
