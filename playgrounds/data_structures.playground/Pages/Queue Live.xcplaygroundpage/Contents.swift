// Да дефинираме структура Опашка (FIFO - first-in first-out), която има функции enqueue и dequeue
// Опашката трябва да има и {get} полета count: Int, isEmpty: Bool, front: Int

protocol CustomCollection {
    var count: Int { get }
    var isEmpty: Bool { get }
}

protocol QueueCollection: CustomCollection {
    var front: Int? { get }
    mutating func enqueue(_ element: Int)
    mutating func dequeue() -> Int?
}

struct Queue {
    
}

//var queue = Queue()
//
//queue.isEmpty
//queue.enqueue(1)
//
//queue.front
//
//queue.enqueue(2)
//
//queue.dequeue()
//queue.dequeue()
