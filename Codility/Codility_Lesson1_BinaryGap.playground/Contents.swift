//https://app.codility.com/programmers/lessons/1-iterations/binary_gap/

import UIKit

func solution(_ N : Int) -> Int {
    var answer = 0
    
    let binary = String(N, radix: 2)
    print("Binary: \(binary)")
    
    var binaryGapList: [String] = []
    var binaryGap: Int = 0
    
    for char in binary {
        print(char)
        if String(char) == "1" { // 1일때
            if (binaryGapList.first ?? "0") == "1" { // 1... '1' 로 닫음
                answer = max(answer, binaryGap)
                binaryGapList.removeAll()
                binaryGap = 0
            }
            binaryGapList.append(String(char))
            
        } else { // 0일떄
            if (binaryGapList.first ?? "0") == "1" { // '1' 로 염
                binaryGap += 1
            }
            binaryGapList.append(String(char))
        }
        
        print("BinaryGapList: \(binaryGapList), gap: \(binaryGap)")
    }
    
    return answer
}

let n1 = 9 // 2
let n2 = 529 // 4
let n3 = 15 // 0

print("Answer: \(solution(n3))")
