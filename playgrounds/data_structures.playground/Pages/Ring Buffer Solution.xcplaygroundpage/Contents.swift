// Цикличен буфер
protocol CustomCollection {
    var count: Int { get }
    var isEmpty: Bool { get }
}

protocol RingBufferCollection: CustomCollection {
    var isFull: Bool { get }
    init(count: Int)
    mutating func write(_ element: Int) -> Bool
    mutating func read() -> Int?
}

struct RingBuffer: CustomStringConvertible, RingBufferCollection {
    private var store: [Int?]
    private var readIndex = 0
    private var writeIndex = 0
    
    var description: String {
        return "\(store)"
    }
    
    var count: Int {
        return store.count
    }
    
    var isEmpty: Bool {
        return readSpace == 0
    }
    
    var isFull: Bool {
        return writeSpace == 0
    }
    
    private var readSpace: Int {
        return writeIndex - readIndex
    }
    
    private var writeSpace: Int {
        return store.count - readSpace
    }
    
    init(count: Int) {
        store = [Int?](repeating: nil, count: count)
    }
    
    mutating func write(_ element: Int) -> Bool {
        guard !isFull else {
            return false
        }
        
        let nextWriteIndex = writeIndex % count
        store[nextWriteIndex] = element
        writeIndex += 1
        
        return true
    }
    
    mutating func read() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        let nextReadIndex = readIndex % count
        let element = store[nextReadIndex]
        readIndex += 1
        
        return element
    }
}

var buffer = RingBuffer(count: 2)

buffer.write(1)
buffer.write(2)
buffer.write(3)

buffer
//buffer.read()
//buffer.read()

buffer.write(4)
//buffer.write(5)

buffer

buffer.read()
buffer.read()
buffer.read()
buffer.read()
