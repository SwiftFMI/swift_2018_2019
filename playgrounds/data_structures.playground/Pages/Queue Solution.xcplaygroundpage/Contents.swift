protocol CustomCollection {
    var count: Int { get }
    var isEmpty: Bool { get }
}

protocol QueueCollection: CustomCollection {
    associatedtype Element
    
    var front: Element? { get }
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}

struct Queue<Item>: CustomStringConvertible, QueueCollection {
    private var store = [Item]()
    
    var description: String {
        return "\(store)"
    }
    
    var count: Int {
        return store.count
    }
    
    var isEmpty: Bool {
        return store.isEmpty
    }
    
    var front: Item? {
        return store.first
    }
    
    init() { }
    
    init(_ element: Item) {
        enqueue(element)
    }
    
    mutating func enqueue(_ element: Item) {
        store.append(element)
    }
    
    mutating func dequeue() -> Item? {
        guard isEmpty == false else {
            return nil
        }
        
        return store.removeFirst()
    }
}

var queue = Queue<String>()
var queue2 = Queue(1)

queue.enqueue("a")
queue.enqueue("b")
queue.enqueue("c")
queue.enqueue("40")
queue.enqueue("50")
queue.enqueue("60")
queue.enqueue("70")
queue.enqueue("80")
queue.enqueue("90")
queue.enqueue("10")

queue.dequeue()
queue.dequeue()
queue.dequeue()
//queue.dequeue()

queue
