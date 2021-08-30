//https://programmers.co.kr/learn/courses/30/lessons/42578
//LEVEL 2
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var typePerItem: [String: [String]] = [:]
    var answer: Int = 1
    
    //1. 옷의 종류: [아이템] 의 형태로 딕셔너리에 저장
    clothes.forEach { cloth in
        let item = cloth[0]
        let type = cloth[1]
        
        if typePerItem.keys.contains(type) {
            typePerItem[type]?.append(item)
        } else {
            typePerItem[type] = [item]
        }
    }
    
    //2. 옷의 종류들을 루프 돌면서 경우의 수 추가
    let types = Array(typePerItem.keys)
    for i in 0..<types.count {
        answer *= typePerItem[types[i]]!.count + 1 ///입지 않는경우도 있으므로 +1
    }
    
    return answer - 1 //모두 안입는 경우를 빼줌 -1
}

let clothes1 = [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]
let clothes2 = [["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]
let clothes3 = [["a1", "a"], ["a2", "a"], ["b1", "b"], ["b2", "b"], ["b3", "b"], ["c1", "c"]]
//solution(clothes1) //정답: return 5
//solution(clothes2) //정답: return 3
solution(clothes3) //정답: return 23
