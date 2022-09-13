import Foundation

enum CompareDownState {
    case none
    case left
    case right
}

struct MinHeap<T: Comparable> {
    var heap: Array<T> = []
    
    init() { }
    
    init(data: T) {
        heap.append(data) // 1번 인덱스부터 사용하기 위해 0번 인덱스에 초기값 넣어줌
        heap.append(data)
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    mutating func insert(data: T) {
        print("insert: \(data)")
        /// 1번 인덱스부터 사용할것이기 때문에 비어있을 경우에는 0번 인덱스를 채워줌
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            print("초기값데스")
            return
        }
        
        heap.append(data)
        
        var insertIndex = heap.count - 1
        while isCompareUp(index: insertIndex) {
            let parentIndex = insertIndex / 2
            print("스왑해 p: \(parentIndex), insert: \(insertIndex)")
            heap.swapAt(parentIndex, insertIndex)
            insertIndex = parentIndex
        }
        print("curret Heap: \(heap)")
    }
    
    private func isCompareUp(index: Int) -> Bool {
        print("is compareup index: \(index)")
        let currentIndex = index
        if currentIndex <= 1 { return false } // Root node
        
        let parentIndex = index / 2
        print("parent: \(heap[parentIndex]), current: \(heap[currentIndex])")
        return heap[parentIndex] < heap[currentIndex] ? false : true
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        let popValue = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        var poppedIndex = 1
        while true {
            switch isCompareDown(index: poppedIndex) {
            case .none:
                print("팝후 current heap: \(heap)")
                return popValue
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(leftChildIndex, poppedIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = poppedIndex * 2 + 1
                heap.swapAt(rightChildIndex, poppedIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
    
    private func isCompareDown(index: Int) -> CompareDownState {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1
        
        // child 없는경우
        if leftChildIndex >= heap.count {
            return .none
        }
        
        let leftChildValue = heap[leftChildIndex]
        let rightChildValue = heap[rightChildIndex]
        let currentIndexValue = heap[index]
        
        // 왼쪽 child만 있는 경우
        if rightChildIndex >= heap.count {
            return leftChildValue > currentIndexValue ? .none : .left
        }
        
        // 왼쪽, 오른쪽 child 둘 다 있는 경우
        // 왼쪽, 오른쪽 child 모두 자신보다 클 경우
        if leftChildValue > currentIndexValue && rightChildValue > currentIndexValue {
            return .none
        }
        
        /// 왼쪽, 오른쪽 child 모두 자신보다 작을 경우 둘 중 작은 child 선택
        if leftChildValue < currentIndexValue && rightChildValue < currentIndexValue {
            return leftChildValue < rightChildValue ? .left : .right
        }
        
        /// 왼쪽, 오른쪽 child 중 하나만 자신보다 작을 경우
        if leftChildValue < currentIndexValue || rightChildValue < currentIndexValue {
            return leftChildValue < rightChildValue ? .left : .right
        }
        
        return .none
    }
}

struct Task: Comparable {
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.startTime + lhs.taskTime + lhs.waitTime < rhs.startTime + rhs.taskTime + rhs.waitTime
    }
    
    var startTime: Int
    var taskTime: Int
    var totalTime: Int
    var waitTime: Int
}
