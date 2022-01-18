//https://programmers.co.kr/learn/courses/30/lessons/42578
//LEVEL 2
import Foundation

///* 수학공식으로 풀이함. 각 의상종류의 의상개수 + 1 을하여 모두 곱하고 뺴기 1을 해줌 (반드시 1개는 착용해야하므로)
func solution(_ clothes:[[String]]) -> Int {
    
    var answer: Int = 1
    var clothesDict: [String: [String]] = [:]
    var clothesCount: Int = 0
    
    clothes.forEach { cloth in
        clothesCount += 1
        if clothesDict[cloth[1]] != nil {
            clothesDict[cloth[1]]!.append(cloth[0])
        } else {
            clothesDict[cloth[1]] = [cloth[0]]
        }
    }
    print("CD:", clothesDict)
    print("Cloth Count: ", clothesCount)
    
    clothesDict.forEach { (k, v) in
        print("k: \(k),v : \(v)")
        answer *= (v.count + 1)
    }
    
    return answer - 1
}

//let clothes1 = [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]
//print("리턴 1: \(solution(clothes1))") // 5
//
//let clothes2 = [["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]
//print("리턴 2: \(solution(clothes2))") // 3

let clothes3 = [["a", "aa"], ["b", "aa"], ["c", "aa"], ["aa", "bb"], ["bb", "bb"], ["cc", "bb"], ["aaa", "cc"], ["bbb", "cc"], ["ccc", "cc"]]
print("리턴 3: \(solution(clothes3))") // 63

//let clothes4 = [["a", "a"], ["b", "b"], ["c", "c"]]
//print("리턴 4: \(solution(clothes4))") // 7
