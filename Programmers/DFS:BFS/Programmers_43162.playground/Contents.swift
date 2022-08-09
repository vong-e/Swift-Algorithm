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

// 22.08.10 다시 풀어본 코드
func solution220810(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    var isVisitied = Array.init(repeating: false, count: n)
    
    func search(row: Int) {
        print("* Search computers at row: \(row)")
        isVisitied[row] = true
        for i in 0..<n {
            if row == i { continue }
            print("row: \(row)의 \(i) 써칭")
            
            if computers[row][i] == 1 {
                print("===> 연결되어있음: \(i)")
                // 다시 연결된 컴퓨터 에 연결된 컴퓨터 서치
                if !isVisitied[i] {
                    print("방문하지 않았던 \(i)로우 컴퓨터, 써치!")
                    search(row: i)
                }
            }
        }
    }
    
    for i in 0..<computers.count {
        if !isVisitied[i] {
            print("===========> 방문안함: \(i)번째 row")
            answer += 1
            search(row: i)
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

//let n3 = 4
//let computers3 = [[1, 1, 0, 1], [1, 1, 0, 0], [0, 0, 1, 1], [1, 0, 1, 1]]
//print("리턴 3: \(solution(n3, computers3))") // answer: 1


