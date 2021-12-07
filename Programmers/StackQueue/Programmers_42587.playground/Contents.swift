//https://programmers.co.kr/learn/courses/30/lessons/42587
//LEVEL 2
import Foundation


func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var priorityList = priorities
    var answer = 0
    var currentIndex = location
    
    print("찾는애: ", priorities[location])
    
//    if priorities.max() == priorities[location] {
//        print("맥스값")
//        return 1
//    }
    
    while !priorityList.isEmpty {
        let max: Int = priorityList.max()!
        print("max: \(max)")
        print("priFirst: \(priorityList.first!)")
        print("이때 인덱스: ",currentIndex)
        if priorityList.first! < max {
            print("맥스보다작아")
            priorityList.append(priorityList.first!)
            priorityList.removeFirst()
            
            if currentIndex == 0 {
                currentIndex = priorityList.count - 1
            } else {
                currentIndex -= 1
            }
            print("==> 인덱스: ",currentIndex)
        } else if priorityList.first! == max {
            print("맥스다 앤써더해")
            answer += 1
            if currentIndex == 0 {
                //얘가 찾은놈
                print("찾은놈: \(answer)")
                return answer
            } else {
                print("리무부퍼스트")
                priorityList.removeFirst()
                print("이떄 프리리스트: ",priorityList)
                currentIndex -= 1
                print("==> 인덱스: ",currentIndex)
            }
        }
    }
    
    return answer
}

let priorities = [2, 1, 3, 2]
let location = 2

let priorities2 = [1, 1, 9, 1, 1, 1]
let location2 = 0

let priorities3 = [1, 1, 1, 1, 1, 1]
let location3 = 3

let priorities4 = [2, 3, 3, 2, 9, 3, 3]
let location4 = 3
//print("리턴: ", solution(priorities, location)) //1
//print("리턴: ", solution(priorities2, location2)) //5
//print("리턴: ", solution(priorities3, location3)) //4
//print("리턴: ", solution(priorities4, location4)) //6
