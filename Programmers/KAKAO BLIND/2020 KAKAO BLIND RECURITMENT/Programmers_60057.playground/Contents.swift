//https://programmers.co.kr/learn/courses/30/lessons/60057?language=swift
//LEVEL 2
import Foundation

func solution(_ s:String) -> Int {
    var minCount = s.count
    
    for length in 0...s.count/2 { //반복이 되어야 압축이 되니까 n/2 까지만 loop
        let dividedList = stringDivider(str: s, length: length)
        
        var wholeString = ""
        var compareString = ""
        var repeatCount = 1
        
        for idx in 0..<dividedList.count {
            if compareString.isEmpty {
                compareString = dividedList[idx]
            } else {
                if compareString == dividedList[idx] {
                    repeatCount += 1
                } else {
                    if repeatCount > 1 {
                        wholeString += "\(repeatCount)\(compareString)"
                        repeatCount = 1
                    } else {
                        wholeString += compareString
                    }
                    compareString = dividedList[idx]
                }
            }
        }
        
        if repeatCount > 1 {
            wholeString += "\(repeatCount)\(compareString)"
        } else {
            wholeString += "\(compareString)"
        }
        
        minCount = min(minCount, wholeString.count)
    }
    
    return minCount
}

func stringDivider(str: String, length: Int) -> [String] {
    var strList: [String] = []
    var temp = ""
    
    for char in str {
        temp += String(char)
        if temp.count == length {
            strList.append(temp)
            temp = ""
        }
    }
    if !temp.isEmpty {
        strList.append(temp)
    }
    
    return strList
}

///Test Case
let s = "aabbaccc"
print("리턴: \(solution(s))") //7

//let s1 = "ababcdcdababcdcd"
//print("리턴: \(solution(s1))") //9
//
//let s2 = "abcabcdede"
//print("리턴: \(solution(s2))") //8
//
//let s3 = "abcabcabcabcdededededede"
//print("리턴: \(solution(s3))") //14
//
//let s4 = "xababcdcdababcdcd"
//print("리턴: \(solution(s4))") //17
