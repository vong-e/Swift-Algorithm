//<이것이 취업을 위한 코딩테스트다> 음료수 얼려 먹기 문제 - DFS
//https://youtu.be/PqzyFDUnbrY?list=PLRx0vPvlEmdBFBFOoK649FlEMouHISo8N&t=3428
import Foundation

func iceCreamCountAtOnce(n: Int, m: Int, iceMold: [String]) -> Int {
    
    var answer: Int = 0
    var iceCreamMold: [[String]] = []
    
    for i in 0..<iceMold.count {
        iceCreamMold.append(iceMold[i].map{String($0)})
    }
    
    for x in 0..<n {
        for y in 0..<m {
            print("x: \(x), y: \(y) -> \(iceCreamMold[x][y])")
            if dfs(n: n, m: m, x: x, y: y, mold: &iceCreamMold) {
                print("```````````앤써더해")
                answer += 1
            }
        }
    }
    
    return answer
}

func dfs(n: Int, m: Int, x: Int, y: Int, mold: inout [[String]]) -> Bool {
    print("DFS. x: \(x), y: \(y)")
  
    if x <= -1 || x >= n || y <= -1 || y >= m {
        return false
    }
    
    let direction: [(Int, Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우
    
    if mold[x][y] == "0" {
        mold[x][y] = "1"
        print("방문처리.")
        print("mold: \(mold)")
        for dir in direction {
            let dx = x + dir.0
            let dy = y + dir.1
            print("dx: \(dx), dy: \(dy)")
            dfs(n: n, m: m, x: dx, y: dy, mold: &mold)
        }
        return true
    }
    return false
}


let n: Int = 4
let m: Int = 5
let iceMold: [String] = ["00110",
                        "00011",
                        "11111",
                        "00000"]

//print("한 번에 만들 수 있는 아이스크림의 개수: \(iceCreamCountAtOnce(n: n, m: m, iceMold: iceMold))")


// 22.04.08 풀이
func eatFrozonDrink(n: Int, m: Int, mold: [String]) -> Int {
    var answer = 0
    
    let direction = [(0, -1), (0, 1), (-1, 0), (1, 0)] // 상, 하, 좌, 우
    
    var iceCreamMold: [[String]] = mold.map { $0.map{ String($0) } }
    
    func searchEmptySpace(row: Int, col: Int) {
        iceCreamMold[row][col] = "1"
        
        direction.forEach { (dx, dy) in
            
            if row + dx < 0 || row + dx >= n || col + dy < 0 || col + dy >= m {
                return
            }
            
            if iceCreamMold[row + dx][col + dy] == "0" {
                searchEmptySpace(row: row + dx, col: col + dy)
            }
            
        }
    }
    
    for row in 0..<n {
        for col in 0..<m {
            if iceCreamMold[row][col] == "0" { // 빈공간
                answer += 1
                searchEmptySpace(row: row, col: col)
            }
        }
    }
    
    return answer
}

print("한 번에 만들 수 있는 아이스크림의 개수: \(eatFrozonDrink(n: n, m: m, mold: iceMold))")
