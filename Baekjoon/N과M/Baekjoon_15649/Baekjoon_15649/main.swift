//
//  main.swift
//  Baekjoon_15649
//
//  Created by KIM SONGBONG on 2022/06/08.
//

import Foundation

//let input = readLine()!
//let inputList: [Int] = input.split(separator: " ").map{Int(String($0))!}
//
//let number: Int = inputList.first!
//let numberList: [Int] = generateNumberList()
//
//let numberOfValueInPermutation: Int = inputList.last!
//
//func generateNumberList() -> [Int] {
//    var numberList: [Int] = []
//    for i in 0..<number {
//        numberList.append(i + 1)
//    }
//    return numberList
//}
//
//func permutation(temp: [Int], numbers: [Int], currentIndex: Int) {
//
//    var numberList = numbers
//
//    if currentIndex == numberOfValueInPermutation {
//        print(temp.map{String($0)}.joined(separator: " "))
//        return
//    }
//
//    for i in currentIndex..<number {
//        numberList = numberList[0..<currentIndex] + numberList[currentIndex...  ].sorted()
//        numberList.swapAt(i, currentIndex)
//        permutation(temp: temp + [numberList[currentIndex]], numbers: numberList, currentIndex: currentIndex + 1)
//        numberList.swapAt(i, currentIndex)
//    }
//}
//
//permutation(temp: [], numbers: numberList, currentIndex: 0)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let number = input[0]
let findCount = input[1]

let visited = Array.init(repeating: false, count: number)
var temp: [Int] = []
var depth = 0

func backTracking(depth: Int) {
    if depth == findCount {
        print("앤쒈:")
    }
}
