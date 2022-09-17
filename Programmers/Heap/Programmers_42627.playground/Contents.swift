// https://school.programmers.co.kr/learn/courses/30/lessons/42627?language=swift
// LEVEL 3
import Foundation

struct Task: Equatable {
    var startTime: Int
    var taskTime: Int
}

func solution(_ jobs:[[Int]]) -> Int {
    var currentTime: Int = 0
    var totalTime: Int = 0
    var finishedTask: Int = 0
    
    var taskList: [Task] = jobs.map { Task(startTime: $0[0], taskTime: $0[1]) }
    
    /// 시작 시간이 같을 경우 작업 시간으로 정렬, 다를 경우 시작 시간으로 정렬
    taskList.sort(by: { $0.startTime == $1.startTime ? $0.taskTime < $1.taskTime : $0.startTime < $1.startTime })
    
    while finishedTask != jobs.count {
        /// Loop마다 현재 시작 가능한 작업을 가져와서 짧은 task 순으로 정렬
        var availableList = taskList.filter { $0.startTime <= currentTime }
        availableList.sort(by: { $0.taskTime < $1.taskTime })
        
        if availableList.isEmpty {
            currentTime += 1
        } else {
            let firstTask = availableList.first!
            /// 작업할 Task를 taskList에서 제거
            if let taskIndex = taskList.firstIndex(where: { $0 == firstTask }) {
                taskList.remove(at: taskIndex)
            }
            
            currentTime += firstTask.taskTime
            totalTime += firstTask.taskTime
            
            let availableTaskDuringFirstTask = taskList.filter { $0.startTime <= currentTime }
            
            availableTaskDuringFirstTask.forEach { availableTask in
                totalTime += currentTime - availableTask.startTime
                /// currentTime - availableTask.startTime를 해줌으로써 시작 전 wait time에 대한 처리를 해줬으므로 startTime 변경해줌
                if let availableTaskIndex = taskList.firstIndex(where: { $0 == availableTask }) {
                    taskList[availableTaskIndex].startTime = currentTime
                }
            }
            finishedTask += 1
        }
    }
    
    return totalTime / finishedTask
}

let jobs = [[0, 3], [1, 9], [2, 6]]
print("answer: \(solution(jobs))") // 9

//let jobs2 = [[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]]
//print("answer2: \(solution(jobs2))") // 72
