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
    private var store = [Int?]() // Елементите в масива мога да са nil - празно място за почистване по-късно
    private var head = 0 // Запазваме индекса на първия не-празен елемент
    
    var description: String {
        return "\(store)"
    }
    
    var count: Int {
        return store.count - head // от общия брой елементи в масива, вадим броя празни елементи
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var front: Int? {
        if isEmpty {
            return nil
        }
        
        return store[head]
    }
    
    mutating func enqueue(_ element: Int) {
        store.append(element)
    }
    
    mutating func dequeue() -> Int? {
        // добавяме проверка за индекса < броя елементи, вземаме елемента на индекса
        guard isEmpty == false, head < store.count, let element = store[head] else {
            return nil
        }
        
        store[head] = nil // на мястото на елемента, поставяме nil - празно място в масива
        head += 1 // Увеличаваме индекса на първия не-празен елемент
        
        let emptyPart = Double(head) / Double(store.count) // изчисляваме количеството празни елементи в масива
        
        if emptyPart > 0.3 && store.count > 5 { // при повече от 30% празни елемента и при общ брой по-голям от 5, зачистваме празните елементи и отместваме индекса
            store.removeFirst(head)
            head = 0
        }
        
        return element // връщаме взетия елемент
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


queue
queue.front

queue.dequeue()

queue
queue.front
