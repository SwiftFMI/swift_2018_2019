// Да дефинираме структура Стек (LIFO - last-in first-out), който има функции push и pop.
// Стека трябва да има и {get} полета count: Int, isEmpty: Bool, top: Int

protocol CustomCollection {
    var count: Int { get }
    var isEmpty: Bool { get }
}

protocol StackCollection: CustomCollection {
    var top: Int? { get }
    mutating func push(_ element: Int)
    mutating func pop(_ element: Int)
}

struct Stack {
    
}

//var stack = Stack()
//stack.isEmpty
//
//stack.push(1)
//stack.top
//
//stack.pop()
//
//stack.pop()
