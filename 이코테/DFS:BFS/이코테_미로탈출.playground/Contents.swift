//<이것이 취업을 위한 코딩테스트다> 미로 탈출 문제 - BFS
//https://youtu.be/PqzyFDUnbrY?list=PLRx0vPvlEmdBFBFOoK649FlEMouHISo8N&t=3925
import Foundation

func mazeEscape(n: Int, m: Int, mazeArray: [String]) {
    
    var maze: [[Int]] = []
    
    mazeArray.forEach { mazeRow in
        maze.append(mazeRow.map{Int(String($0)) ?? 0})
    }
    
    for x in 0..<n {
        for y in 0..<m {
            print("\(x), \(y) ... \(maze[x][y])")
            bfs(x: x, y: y, n: n, m: m, maze: &maze)
        }
    }
    
    print("최종 maze: ", maze)
}

func bfs(x: Int, y: Int, n: Int, m: Int, maze: inout [[Int]]) {
    print("BFS---- x: \(x), y: \(y)")
    var queue: [(Int, Int)] = []
    queue.append((x, y))
    print("Queue: \(queue)")
    
    while !queue.isEmpty {
        let x = queue.first!.0
        let y = queue.first!.1
        queue.removeFirst()
        print("--------------> WHILE - x:\(x), y:\(y)")
        let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)] //상,하,좌,우
        
        direction.forEach { dir in
            let dx = x + dir.0
            let dy = y + dir.1
            print("DX: \(dx), DY: \(dy)")
            
            if dx < 0 || dx >= n || dy < 0 || dy >= m {
                print("범위 밖")
                return
            }
            
            if maze[dx][dy] == 0 {
                print("0임 돌아가")
                return
            }
            if maze[dx][dy] == 1 {
                maze[dx][dy] = maze[x][y] + 1
                print("1임. maze[x][y]: \(maze[x][y]),  maze[dx][dy]: \(maze[dx][dy])")
                queue.append((dx, dy))
            }
        }
    }
}


let n: Int = 5
let m: Int = 6
let mazeArray: [String] = ["101010",
                          "111111",
                          "000001",
                          "111111",
                          "111111"]

print("미로 탈출 최소 이동 칸의 개수: \(mazeEscape(n: n, m: m, mazeArray: mazeArray))")
