// dequeue функцията е бавна (махаме първия елемент и преместваме всички останали с 1 наляво)
// Да оптимизираме тази функция, пазейки индекс на последно извадения елемент и да "почистваме" периодично

protocol CustomCollection {
    var count: Int { get }
    var isEmpty: Bool { get }
}

protocol QueueCollection: CustomCollection {
    var front: Int? { get }
    mutating func enqueue(_ element: Int)
    mutating func dequeue() -> Int?
}

struct Queue: CustomStringConvertible, QueueCollection {
    private var store = [Int]()
    
    var description: String {
        return "\(store)"
    }
    
    var count: Int {
        return store.count
    }
    
    var isEmpty: Bool {
        return store.isEmpty
    }
    
    var front: Int? {
        return store.first
    }
    
    mutating func enqueue(_ element: Int) {
        store.append(element)
    }
    
    mutating func dequeue() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        return store.removeFirst()
    }
}

var queue = Queue()

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
queue.enqueue(8)
queue.enqueue(9)
queue.enqueue(10)

queue.dequeue()
queue.dequeue()
queue.dequeue()
//queue.dequeue()

queue

