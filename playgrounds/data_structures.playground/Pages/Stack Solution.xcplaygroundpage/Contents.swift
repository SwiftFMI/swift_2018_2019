protocol CustomCollection {
    var count: Int { get }
    var isEmpty: Bool { get }
}

protocol StackCollection: CustomCollection {
    var top: Int? { get }
    mutating func push(_ element: Int)
    mutating func pop(_ element: Int)
}

struct Stack: CustomStringConvertible, CustomCollection {
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
    
    var top: Int? {
        return store.last
    }
    
    mutating func push(_ element: Int) {
        store.append(element)
    }
    
    mutating func pop() -> Int? {
        return store.popLast()
    }
}

var stack = Stack()
stack.isEmpty

stack.push(12)
stack.top
stack.push(31)
stack.top

stack.isEmpty
stack.count

stack.pop()
stack.pop()
stack.pop()

stack.top
